Beringei Erlang Client
=================

This is an Experimental erlang client for [Beringei](git@github.com:facebookincubator/beringei.git)

Uses [French Thrift](https://github.com/guardian/french-thrift) to generate protocol from Beringei Thrift definitions.

To connect to Beringei service:

```
beringei_client:connect("localhost", 9999).

{tclient,beringei_service_thrift,
    {protocol,thrift_binary_protocol,
        {binary_protocol,
            {transport,thrift_buffered_transport,
                {buffered_transport,
                    {transport,thrift_socket_transport,
                        {data,#Port<0.21721>,infinity}},
                    []}},
            true,true}},
    0}
```
