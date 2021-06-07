/*
ifp: 网卡指针
eh: 指向以太网首部
m: payload
 */
void
ether_input(ifp, eh, m)
	struct ifnet *ifp;
	register struct ether_header *eh;
	struct mbuf *m;
{
	register struct ifqueue *inq;
	register struct llc *l;
	struct arpcom *ac = (struct arpcom *)ifp;
	int s;

    // 接口被禁用直接丢弃包
	if ((ifp->if_flags & IFF_UP) == 0) {
		m_freem(m);
		return;
	}

	ifp->if_lastchange = time;
	ifp->if_ibytes += m->m_pkthdr.len + sizeof (*eh);
    // 判断所接收的分组是广播分组还是多播分组
	if (bcmp((caddr_t)etherbroadcastaddr, (caddr_t)eh->ether_dhost,
	    sizeof(etherbroadcastaddr)) == 0)
		m->m_flags |= M_BCAST;
	else if (eh->ether_dhost[0] & 1)
		m->m_flags |= M_MCAST;
	if (m->m_flags & (M_BCAST|M_MCAST))
		ifp->if_imcasts++;

	switch (eh->ether_type) {
	case ETHERTYPE_IP:
    // 对于IP分组,触发IP软中断,选择ipintrq
		schednetisr(NETISR_IP);
		inq = &ipintrq;
		break;
    // 对于ARP分组,触发ARP软中断,选择arpintrq
	case ETHERTYPE_ARP:
		schednetisr(NETISR_ARP);
		inq = &arpintrq;
		break;
    // 其他类型的帧直接丢弃
	default:
		if (eh->ether_type > ETHERMTU){
			m_freem(m);
			return;
		}
	}

	s = splimp();
    // 把分组放入队列,若队列已满,就丢弃;当schednetisr触发的软中断发生时就处理输入队列
	if (IF_QFULL(inq)) {
		IF_DROP(inq);
		m_freem(m);
	} else
		IF_ENQUEUE(inq, m);
	splx(s);
}