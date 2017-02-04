
public class No02_SingleTon {

	/**
	 * 设计一个类，我们只能生成该类的一个实例。
	 */
	public static void main(String[] args) {
		A a1 = A.getInstance();
	}
	
}
//饿汉式  线程安全
class A{
	private static final A a=new A();
	private A(){}
	public static A getInstance(){
		return a;
	}
}

//懒汉式 线程安全写法
class B {

	//类初始化时，不初始化这个对象（延时加载，真正用的时候再创建）。
	private static B instance;

	private B(){ //私有化构造器
	}

	//方法同步，调用效率低！
	public static synchronized B getInstance(){
		if(instance==null){
			instance = new B();
		}
		return instance;
	}

}
