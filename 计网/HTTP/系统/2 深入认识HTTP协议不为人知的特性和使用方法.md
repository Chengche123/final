1 乱码的原因:
    一: 编码和解码方式不同
    二: **编码方式对应的字符集里不包含指定字符**

2 URL的编码与解码:
    一: 需要对URL中**属于ASCII字符集的保留字和非ASCII字符编码**
        对URL中属于ASCII字符集的非保留字不做编码;**对URL中的ASCII字符集的保留字**需要取其ASCII内码，然后加上“%”前缀将该字符进行编码;**对于URL中的非ASCII字符**需要取其Unicode内码，然后加上“%"前缀将该字符进行编码。
    
3 HTTP协议之基本认证:
    一: Basic认证: 不安全
            Basic认证是一种较为简单的HTTP认证方式，客户端通过明文（Base64编码格式）传输用户名和密码到服务端进行认证，通常需要配合HTTPS来保证信息传输的安全。
            header: Authorization:Basic ZmVuZ2x1bzoxMjMONTY=
    二: Digest认证: 不安全
            摘要认证除了能够保护密码之外，并不能保护其他内容，与HTTPS配合使用仍是一个良好的选择。
    三: SSL客户端认证: 成本高
            SSL客户端认证是借由HTTPS的客户端证书完成认证的方式。凭借客户端证书认证， 服务器可确认访问是否来自己登录的客户端。
    四: 基于表单的认证: **较常用**
            基于表单的认证方法并不是在HTTP协议中定义的。
            使用由Web应用程序各自实现基于表单的认证方式。
            通过Cookie和Session的方式来保持用户的状态。

4 HTTP的长连接与短连接:
    一: 
        HTTP协议是基于请求/响应模式的，因此只要服务端给了响应，本次HTTP请求就结束了。
        HTTP的长连接和短连接**本质上是TCP长连接和短连接**。
    二: HTTP1.0和HTTP2.0的默认:
            **HTTP/1.0中，默认使用的是短连接**。也就是说，浏览器和服务器每进行一次HTTP操作， 就建立一次连接,结束就中断。
            **HTTP/1.1起，默认使用长连接**,用以保持连接特性。
    三: 长连接建立过程:
            http1.0请求与服务端的交互过程:
                a)
                    客户端发出带有包含一个header：”Connection： keep-alive“的请求
                b)
                    服务端接收到这个请求后,根据http1.0和”Connection： keep-alive“判断出这是一个长连接,就会在response的header中也增加”Connection： keep-alive“,同是**不会关闭已建立的tcp连接.**
                c)
                    客户端收到服务端的response后,发现其中包含”Connection： keep-alive“，就认为是一个长连接，**不关闭这个连接**。
            http1.1请求与服务端的交互过程:
                a)
                    客户端发出http1.1的请求
                b)
                    服务端收到http1.1后就认为这是一个长连接,会在返回的response设置Connection： keep-alive,**同时不会关闭已建立的连接.**
                c)
                    客户端收到服务端的response后,发现其中包含”Connection： keep-alive“，就认为是一个长连接，**不关闭这个连接**。

5 HTTP中介之代理(略)

6 HTTP中介之网关:
    一: **微服务下的安全API网关**
            客户端接口调用用的是HTTPS协议, 到达API网关后, API网关调用下游微服务用的是GRPC

7 HTTP缓存:
    一: HTTP缓存头部字段
            **Cache-Control**
                **请求/响应头，缓存控制字段**
                no-store:所有内容都不缓存。
                no-cache:缓存,但是浏览器使用缓存前，都会请求服务器判断缓存资源是否是最新。
                max-age=x(单位秒)请求缓存后的X秒不再发起请求。
                s-maxage=x(单位秒)代理服务器请求源站缓存后的X秒不再发起请求，只对CDN缓存有效。
                public客户端和代理服务器(CDN)都可缓存。
                private只有客户端可以缓存。
            **Expires**
                **响应头，代表资源过期时间**，由服务器返回提供,是http1.0的属性，在与max-age共存的情况下，优先级要低。
            **Last-Modified**
                **响应头，资源最新修改时间**，由服务器告诉浏览器。
            **if-Modified- Since**
                **请求头，资源最新修改时间**，由浏览器告诉服务器，和Last-Modified是一对，它两会进行对比。
            **Etag**
                **响应头，资源标识**，由服务器告诉浏览器。
            **if-None- Match**
                **请求头，缓存资源标识**，由浏览器告诉服务器(其实就是上次服务器给的Etag),和Etag是一对，它两会进行对比。
    二: HTTP缓存工作方式:
            场景一: 让服务器与浏览器约定一个文件过期时间 - **Expires**
                客户端: 
                    服务器服务器，我现在需要一个f.js文件，帮我找找，然后给我
                服务器: 
                    次次找我要，烦不烦，文件给你可以，我们约定个时间(Expires),时间没到别来烦我了，**服务器返回了f.js以及过期时间Expires.**
            场景二: 
                让服务器与浏览器在约定文件过期时间的基础上，再加一个文件最新修改时间的对比 **Last-Modified与if-Modified-Since**
                客户端:
                    服务器服务器，我现在需要一个f.js,你找到了给我，顺便给我个过期时间，时间没到我保证不烦你!
                服务器:
                    行，过期时间我给你，另外再给你一个文件最新修改时间Last-Modified,到时候文件过期了咱两核对文件修改时间，对得上你就别烦我，**服务器返回f.js+ Expires+Last-Modified.**
            场景三:
                让服务器与浏览器在过期时间Expires+ Last- Modified的基础上，增加一一个文件内容唯一对比标记一**Etag与If-None-Match**。Expires不稳定， 再加入一个max-age来加以代替
                客户端:
                    服务器服务器，我要什么你最懂得
                服务器:
                    我不懂! f.js我给你, 过期时间我也给你，再给你一个max-age= 60(单位秒)，Last-Modified你也给我收好，再加一个**文件内容唯一标识符Etag。**
            缓存改进方案:
                原因:
                    在客户端这边, 缓存到期之前不会再向服务器请求资源
                解决方法:
                    md5/hash缓存
                        通过**不缓存html**,**为静态文件添加MD5或者hash标识**，解决浏览器无法跳过缓存过期时间主动感知文件变化的问题。

8 HTTP内容协商机制:
    一: 内容协商方式:
            客户端驱动:
                客户端发起请求，服务器发送可选项列表,客户端作出选择后在发送第二次请求。
            **服务器驱动(最常用)**:
                服务器**检查客户端的请求头部集**并决定提供哪个版本的页面。
            透明协商:
                某个中间设备(通常是缓存代理)代表客户端进行协商。
    二: 服务器驱动内容协商-请求首部集
            客户端请求:
                **Accept: 告知服务器发送何种媒体类型**
                **Accept-Language:告知服务器发送何种语言**
                **Accept-Charset:告知服务器发送何种字符集**
                **Accept-Encoding: 告知服务器采用何种编码**
            服务器响应(**与上面一一对应**):
                **Content-Type**
                **Content-Language**
                **Content-Type**
                **Content- Encoding**
            近似匹配(**权重q**):
                Accept-Language: en;q=0.5, fr;q=0.0, nl;q=1.0, tr;q=0.0

9 HTTP的断点续传与多线程下载:
    一: 断点续传?多线程下载?
            HTTP是通过在Header里两个参数实现的，**客户端发请求时对应的是Range**，**服务器端响应时对应的是Content-Range**。
    二: Range
            用于请求头中，指定第一个字节的位置和最后-一个字节的位置,
            一般格式:
                Range:(unit=first byte pos)-[last byte pos]
            举例(两边都是闭区间):
                Range: bytes=0-499
                Range: bytes= 500-999
                Range: bytes= -500 :文件的最后500个字节
                Range: bytes= 500- :从500字节到文件结束
                Range: bytes= 500-600,601-999
    三: Content-Range
            用于响应头中，在发出带Range的请求后，服务器会在Content-Range头部返回当前接受的范围和文件总大小。
            一般格式:
                Content-Range: bytes (unit first byte pos) - [last byte pos]/[entity legth]
            而在响应完成后，返回的响应头内容也不同: .
                **HTTP/1.1 200 Ok (不使用断点续传方式)**
                **HTTP/1.1 206 Partial Content (使用断点续传方式)**
    四: 断点续传过程
            1.
                客户端下载一个1024K的文件， 已经下载了其中512K。
            2.
                网络中断，客户端请求续传，因此需要在HTTP头中申明本次需要续传的片段: **Range:bytes=512000-**这个头通知服务端从文件的512K位置开始传输文件。
            3.
                服务端收到断点续传请求,从文件的512K位置开始传输,并且在HTTP头中增加:**Content-Range:bytes 512000-/1024000**
                并且此时服务端返回的HTTP状态码应该是206，而不是200。
























            

            


                













