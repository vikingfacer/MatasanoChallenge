

# the problem is to convert the input to the output through base64 
# this is done primarily with two functions and helper functions 

input = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
output = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"



function base64(input)
	base = string()
	m4 = UInt32(0b0111111)
	m3 = m4 << 6
	m2 = m3 << 6
	m1 = m2 << 6
	# println( bitstring(m4))
	# println( bitstring(m3))
	# println( bitstring(m2))
	# println( bitstring(m1))

	# helper function
	function based(i)
		i = UInt8(i)
		if(i <= 25)
			i += 65
		elseif 25 < i <= 51 
			i += 71
		elseif 51 < i 
			i -= 4
		end
		return Char(i)
	end

	function fourtoUInt32(input1)
		raw = UInt32[]
		c = 6
		num = 0

		# helper function
		function parsehex(x)
			return parse(UInt8, x, base=16)
		end

		for p=map(parsehex, collect(input))
		
	    	num = p | (num << 4) #this shifts over and adds the bit to the UInt32 
			c = c - 1
			if c <= 0
				push!(raw, UInt32(num))
				c = 6
				num = 0
			end
		end
		return raw
	end

	for n=fourtoUInt32(input)
		# println( bitstring(n))
		base = string(base, map(based, Char((n & m1) >> 18) * Char((n & m2) >> 12) * Char((n & m3) >> 6)* Char(n & m4)) )
	end
	return string(base)
end

println(input)
println(output)

@show base64(input) == output