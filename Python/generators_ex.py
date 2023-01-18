def tv_channel():
    yield "Star Tv"
    yield "Star Sports"
    yield "Tenzsports"
    yield "24/7 channel"

for prog in tv_channel():
    print(prog)
# prog=tv_channel()
# print(next(prog))
# print(next(prog))
# print(next(prog))
# print(next(prog))