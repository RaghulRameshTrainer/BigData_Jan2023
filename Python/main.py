numbers="""+91-9964521299
9964521299
99645212999   
996452129     
8964521299
7964521299
6964521299
5964521299
4964521299   
3964521299   
2964521299   
1964521299"""

import re
pattern=re.compile(r"((\+91\-)?\b[5-9]\d{9}\b)")
result=pattern.findall(numbers)
for x in result:
    print(x[0])

