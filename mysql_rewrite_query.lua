function read_query( packet )
   if string.byte(packet) == proxy.COM_QUERY then
     local query = string.sub(packet, 2)
     ---debug print
     ---print ("received " .. query)
     local replacing = false
 
     pconn = proxy.connection.client.default_db
     ---debug print
     ---print "if works"

     if pconn == "<dbname>" then
        ---debug print
        ---print "if works"

        if string.match(query, '<LUA regex for query>') then
    	    --- See manual for string.gsub!!! Regex needed!
    	    query = string.gsub(query,'blah blah blah FROM <tablename> blah blah blah', 'blah blah blah FROM <new_dbname>.<tablename> blah blah blah')
            replacing = true
        end
        ---debug print
        if (replacing) then
            ---print("replaced with " .. query )
            proxy.queries:append(1, string.char(proxy.COM_QUERY) .. query )
            return proxy.PROXY_SEND_QUERY
    	end

     end

   end

end