import sys
 
def hello(name,age):
	print('name:'+name)
	print('age:'+age)
	print('#')
	print('\n');
	print(sys.path)
	return name+age;
 
if __name__ == '__main__':
	hello(sys.argv[1], sys.argv[2])