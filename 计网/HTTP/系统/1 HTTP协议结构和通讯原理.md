1 HTTP协议特点: 请求/响应, 无连接, 无状态
    一:
        客户/服务器模式工作的方式是由**客户端向服务器发出请求,服务器端响应请求**，并进行相应服务
    二:
        灵活
        HTTP允许传输任意类型的数据对象
        正在传输的类型由Content-Type(Content-Type是HTTP包中用来表示内容类型的标识)加以标记
    三:
        **无连接**
        无连接的含义也可以结合HTTP无状态的含义在应用层面上去理解：每一个请求都拥有自己的请求体，期望接收到唯一的对应的响应体，而**每一次的请求都相互独立，与上一次或下一次的请求毫无关系**，哪怕是在同一条连接中（后面说的长连接）。也正因为这个特性，我们在考虑业务代码实现的时候，无需考虑请求之间的关系，只需考虑业务是如何在当前请求完成的。
    四:
        **无状态**
        无状态协议的主要缺点在于，单个请求需要的所有信息都必须要包含在请求中一次发送到服务端，这导致单个消息的结构需要比较复杂，必须能够支持大量元数据，因此HTTP消息的解析要比其他许多协议都要复杂得多。同时，这也导致了**相同的数据在多个请求上往往需要反复传输**，例如同一个连接上的每个请求都需要传输Host、Authentication、Cookies、Server等往往是完全重复的元数据，一定程度上降低了协议的效率。

2 HTTP报文结构: 客户端请求消息,服务器响应消息,HTTP报文头
    一:
        客户端请求消息
        客户端发送一个HTTP请求到服务器的请求消息包括以下格式：**请求行**（request line）、**请求头部**（header）、**空行**和**请求数据**四个部分组成
        例:
            GET /hello.txt HTTP/1.1
            User-Agent: curl/7.16.3 libcurl/7.16.3 OpenSSL/0.9.7l zlib/1.2.3
            Host: www.example.com
            Accept-Language: en, mi
    二:
        服务器响应消息 包括 **响应行,响应头,空行和响应数据**
        例:
            HTTP/1.1 200 OK
            Date: Mon, 27 Jul 2009 12:28:53 GMT
            Server: Apache
            Last-Modified: Wed, 22 Jul 2009 19:15:56 GMT
            ETag: "34aa387-d-1568eb00"
            Accept-Ranges: bytes
            Content-Length: 51
            Vary: Accept-Encoding
            Content-Type: text/plain
    三:
        HTTP报文头(总共47种)分为几类:
            **通用报文头**: 
                Connection-管理连接(Connection: keep-alive, tcp连接不关闭)
                Cache-Control-控制缓存  Upgrade-升级协议
            **实体报文头**: 
                Content-Type Content-Encoding Content-Length
            **请求报文头**: 
                Accept-浏览器可以接受的媒体类型(html,文本,xml) 
                Host-请求资源所在服务器(Host: www.flif.com:8080)
                User-Agent-HTTP客户端程序的信息
            **响应报文头**: 
                Location-令客户端重定向至指定URL 

3 HTTP请求方法: GET POST PUT DELETE HEAD OPTIONS
    一: **GET POST**:
            1 GET参数放URL里, POST参数放在body里面
            2 GET参数有大小限制, POST没有
            3 GET的参数能够通过浏览器历史记录看到, POST的不会
    二: **PUT DELETE**:
            语义上PUT等于更新, DELETE等于删除
    三: HEAD:
            类似于 GET 请求，只不过返回的响应中没有具体的内容，用于获取报头
    四: OPTIONS
            用来查询针对请求URL指定的资源支持的方法

4 HTTP响应状态码:
    一:
        1XX:
            101	Switching Protocols	切换协议。服务器根据客户端的请求切换协议。只能切换到更高级的协议，例如，切换到HTTP的新版本协议
        2XX:
            200	OK	请求成功。一般用于GET与POST请求
            206	Partial Content	部分内容。服务器成功处理了部分GET请求 和断点续传有关
        3XX:
            301	Moved Permanently	永久移动。
            302	Found	临时移动。
            区别:
                301适合永久重定向, 比如网站的域名换了
                302用来做临时跳转, 比如未登陆的用户访问用户中心重定向到登录页面。
            304 Not Modified 
                未修改。所请求的资源未修改，服务器返回此状态码时，不会返回任何资源。客户端通常会缓存访问过的资源，通过提供一个头信息指出客户端希望只返回在指定日期之后修改的资源
        4XX:
            400	Bad Request	客户端请求的语法错误，服务器无法理解
            401	Unauthorized	请求要求用户的身份认证( 我不知道你是谁)
            403	Forbidden	服务器理解请求客户端的请求，但是拒绝执行此请求( 我知道你是谁, 但你权限不够)
            404	Not Found
        5XX:
            500	Internal Server Error	服务器内部错误，无法完成请求
            502	Bad Gateway	充当网关或代理的服务器，从远端服务器接收到了一个无效的请求


5 HTTP状态管理 Cookie与Session: HTTP缺点, Cookie, Session
    一: HTTP缺点:
            **无状态**
            无状态协议的主要缺点在于，单个请求需要的所有信息都必须要包含在请求中一次发送到服务端，这导致单个消息的结构需要比较复杂，必须能够支持大量元数据，因此HTTP消息的解析要比其他许多协议都要复杂得多。同时，这也导致了**相同的数据在多个请求上往往需要反复传输**，例如同一个连接上的每个请求都需要传输Host、Authentication、Cookies、Server等往往是完全重复的元数据，一定程度上降低了协议的效率。
    二:
        Cookie:
            ◆Cookie实际上是一小段的文本信息, **保存在客户端上**。客户端请求服务器，如果服务器需要记录该用户状态，就向客户端浏览器颁发一个Cookie。
            ◆客户端浏览器会把Cookie保存起来。 当浏览器再请求该网站时浏览器把请求的网址连同该Cookie一同提交给服务器。服务器检查该Cookie，以此来辨认用户状态
            Header:
                客户端: Cookie: $Version=1; Skin=new;
                服务器: Set-Cookie: UserID=JohnDoe; Max-Age=3600; Version=1
    三:
        Session:
            ◆Session是另一种记录客户状态的机制， **保存在服务器上**。客户端浏览器访问服务器的时候，服务器把客户端信息以某种形式记录在服务器上
            ◆客户端浏览器再次访问时只需要从该Session中查找该客户的状态就可以了





        