
# Fixed XOR
# Write a function that takes two equal-length buffers and produces their XOR combination.
# If your function works properly, then when you feed it the string:
# 1c0111001f010100061a024b53535009181c
# ... after hex decoding, and when XOR'd against:
# 686974207468652062756c6c277320657965
# ... should produce:
# 746865206b696420646f6e277420706c6179

input = "1c0111001f010100061a024b53535009181c"
ORROR = "686974207468652062756c6c277320657965"
output= "746865206b696420646f6e277420706c6179"

# helper function
function parsehex(x)
	return parse(UInt8, x, base=16)
end

function toChar(x)


@show input = map(parsehex, collect(input))
@show ORROR = map(parsehex, collect(ORROR))

myoutput = reduce(string, map(, xor.(input,ORROR))) # this is almost right the hex values need to be converted like 11 to b and so on. 
myoutput == output 
