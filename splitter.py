class Splitter:
    def split_line (self, string):
        idx = 0
        tokens = []

        while idx < len(string):
            idx = self.skip_space(string, idx)
            token = self.read_next_token(string, idx)
            tokens.append(token)
            idx += len(token)

        return tokens

    def skip_space(self, string, i):

        while i < len(string) and string[i].isspace():
            i += 1

        return i

    def read_next_token(self, string, start):
        start_to_end = {'0': ' ', '1' : ' ', '2' : ' ', '3' : ' ', '4' : ' ', '5' : ' ','6' : ' ','7' : ' ','8' : ' ','9' : ' ','\"': '\"', '[' : ']', '{' : '}', '-' : ' '}

        end = start_to_end[string[start]]

        i = start + 1
        token = string[start]


        while i < len(string) and string[i] != end:
            token += string[i]
            i += 1

        if end == '"' or end == ']':
            token += end

        return token

parser = Splitter()

print(parser.split_line('123.123.123  "sdfsdf sdf sdfs d"     234234'))
        
stat_ip ={}
ip = token[0]

if ip in stat_ip:
    stat_ip[ip] += 1
else:
    stat_ip[ip] = 1





        
