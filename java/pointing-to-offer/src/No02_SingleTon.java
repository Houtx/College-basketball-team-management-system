
public class No02_SingleTon {

	/**
	 * ���һ���࣬����ֻ�����ɸ����һ��ʵ����
	 */
	public static void main(String[] args) {
		A a1 = A.getInstance();
	}
	
}
//����ʽ  �̰߳�ȫ
class A{
	private static final A a=new A();
	private A(){}
	public static A getInstance(){
		return a;
	}
}

//����ʽ �̰߳�ȫд��
class B {

	//���ʼ��ʱ������ʼ�����������ʱ���أ������õ�ʱ���ٴ�������
	private static B instance;

	private B(){ //˽�л�������
	}

	//����ͬ��������Ч�ʵͣ�
	public static synchronized B getInstance(){
		if(instance==null){
			instance = new B();
		}
		return instance;
	}

}
