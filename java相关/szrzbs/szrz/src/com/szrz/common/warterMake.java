package com.szrz.common;
import java.awt.Image;
import java.awt.image.*;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Random;
import javax.imageio.ImageIO;

public class warterMake {
	BufferedImage src=null;
	int iw;
	int ih;
	int [][]Q={{16,11,10,16 , 24 , 40 , 51,  61},
			{12 , 12 , 14 , 19  ,26 , 58 , 60 , 55},
			{14 , 13 , 16 , 24 , 40 , 57 , 69 , 56},
			{14 , 17 , 22 , 29 , 51 , 87 , 80 , 62},
			{18 , 22 , 37 , 56 , 68 , 109 ,103, 77},
			{24 , 35 , 55  ,64 , 81 , 104 , 113 , 92},
			{49 , 64 , 78 , 87  ,103 , 121,  120 , 101},
			{72 , 92 , 95 , 98 , 112 , 100  ,103 , 99}};
	int [][]Q_color={{17, 18 ,24 ,47 ,99, 99, 99 ,99},
					{18, 21, 26, 66 ,99, 99 ,99, 99},
					{24, 26 ,56 ,99, 99 ,99 ,99, 99},
					{47, 66 ,99 ,99, 99, 99, 99, 99},
					{99 ,99 ,99 ,99 ,99, 99, 99, 99},
					{99 ,99 ,99 ,99, 99, 99, 99, 99},
					{99 ,99 ,99 ,99, 99, 99, 99, 99},
					{99 ,99 ,99 ,99, 99, 99, 99, 99}};
	int []ziag={0,8,1,2,9, 16, 24, 17,
			10, 3, 4, 11, 18, 25, 32, 40,
			33, 26, 19, 12, 5, 6, 13, 20,
			27, 34, 41, 48, 56, 49, 42, 35,
			28, 21, 14, 7, 15, 22, 29, 36,
			43, 50, 57, 58, 51, 44, 37, 30,
			23, 31, 38, 45, 52, 59, 60, 53,
			46, 39, 47, 54, 61, 62, 55, 63};
	public warterMake()
	{
		
	}
	public warterMake(BufferedImage src)
	{
		this.src=src;
		iw=src.getWidth();
		ih=src.getHeight();
	}
	/**
	 * DCTϵ������
	 * @param aϵ��
	 * @param n 
	 */
	 void dctCoeff(double a[][], int n)
		{
			int i, j;
		
			for(i = 0; i < n; i++)
				a[0][i] = 1 / Math.sqrt(2.0);
		
			for(i = 1; i < n; i++)
				for(j = 0;j < n; j++)
					a[i][j] = Math.cos(i*Math.PI*(j+0.5)/((double)n));	
		}
		
		//nXn��DCT�任
		void dct(double a[][], double b[][], double c[][], int n)
		{
			int i, j, k;
			double x;
			
	        double af[][] = new double[n][n];		
			for(i = 0; i < n; i++)
			{
				for(j = 0; j < n; j++)
				{
					x = 0.0;
					for(k = 0; k < n; k++)
						x += a[i][k] * b[k][j];
					af[i][j] = x;
				}
		    }
			for(i = 0; i < n; i++)
			{
				for(j = 0; j < n; j++)
				{
					x = 0.0;
					for(k = 0; k < n; k++)
						x += c[i][k] * af[k][j];
						
					a[i][j] = 2.0 * x / n;
				}
			}	
		}

		public double[][] dctTrans(double[][] inIm, int size, 
                double[][] coef, double[][] coefT)
		{	
			int w=inIm.length;
			int h=inIm[0].length;
			double[][] in  = new double[size][size];
			double[][] out = new double[w][h];
			int m=w/size;//�ֿ���
			int n=h/size;
			for(int i = 0; i < m; i++)
			{                
				for(int j = 0; j < n; j++)
				{
					//ȡ��С��size*sizeͼ��image[][]
					for(int k = 0; k < size; k++)
						for(int l = 0; l < size; l++)
							in[k][l] = inIm[i*size+k][j*size+l];
 
					//��С��ͼ��image[][]����DCT�任 
					dct(in, coefT, coef, size);

					//��DCT�任���С��size*size����ƴ�ӳɴ����dctIm
					for(int k = 0; k < size; k++)
						for(int l = 0; l < size; l++)
							out[i*size+k][j*size+l] = in[k][l];	                   
				}
			}
			return out;
		}
		/**
		 * ��ÿһС��m*n����ziag����Ŀǰ����8*8��С��
		 * @param in
		 * ����ziag������һά����
		 */
		public double[][] f_ziag(double [][]in)
		{
			int m=8;
			int n=8;
			//m=q.length;n=q[0].length;
			int l=in[0].length;//�ֳɵĿ���
			double[][] out=new double[m*n][l];
			int i,j;
			for(i=0;i<l;i++)
			   for(j=0;j<m*n;j++)
				  out[j][i]=in[ziag[j]][i];
			return out;
		}
		/**
		 * ziag�������任
		 * @param in
		 * @return
		 */
		public double[][] f_n_ziag(double [][]in)
		{
			int m=8;
			int n=8;
			//m=q.length;n=q[0].length;
			int l=in[0].length;//�ֳɵĿ���
			double[][] out=new double[m*n][l];
			int i,j;
			for(i=0;i<l;i++)
			   for(j=0;j<m*n;j++)
				  out[ziag[j]][i]=in[j][i];
			return out;
		}
		/**
		 * ����ϵ���������ѹ������
		 * mϵ�����������������kΪ����ѹ���������Կ
		 * Bѹ��������ά��n*m*N�ľ���
		 * @param n
		 * @param m
		 * @param N
		 * @param k
		 * @return
		 */
		public int[][][] f_rand_h(int n,int m,int N,int k)
		{
			int [][][]b=new int[n][m][N];
			Random rand=new Random();
			rand.setSeed(k);
			for(int i=0;i<n;i++)
				for(int j=0;j<m;j++)
					for(int l=0;l<N;l++)
					{
						double a=rand.nextDouble();
						b[i][j][l]=a>0.5?1:0;
					}
			return b;
		}
		/**
		 * ͼ��ֿ�
		 * @param x
		 * @param size
		 * @param m
		 * @param n
		 * @return
		 */
		public double[][] F_part(double [][]x,int size,int m,int n,int [][]t)
		{
		//	int m=x.length;
		//	int n=x[0].length;
			int l=m/size;
			int p=n/size;
			double [][]out=new double[size*size][l*p];
			int i,j;
			for(i=0;i<l;i++)
				for(j=0;j<p;j++)
				{
			//		double t[][]=new double [size][size];
					for(int k = 0; k < size; k++)
						for(int q = 0; q < size; q++)
					    	out[k*size+q][i*p+j] = Math.round(x[i*size+k][j*size+q]/Math.round(0.6*t[k][q]));
				}
			return out;
		}
		/**
		 * �ϳ�ͼ�����
		 * @param x
		 * @param size
		 * @param m
		 * @param n
		 * @return
		 */
		public double[][] F_merge(double [][]x,int size,int m,int n,int [][]t)
		{
			double [][]out=new double[m][n];
			int l=m/size;
			int p=n/size;
			int i,j;
			for(i=0;i<l;i++)
				for(j=0;j<p;j++)
				{
					for(int k=0;k<size;k++)
						for(int q=0;q<size;q++)
								out[i*size+k][j*size+q]=Math.round(x[k*size+q][i*p+j]*Math.round(0.6*t[k][q]));
				}
			return out;
		}
		/**
		 * %������ȡ����ȡ�������DCTϵ������ͼ���������Ϣ
			%���룺����DCTϵ��X_qz��������Կkey_1��ÿ�����������ϢΪk����
			%�����������ϢX_i_character
		 * @param X_qz
		 * @param key_1
		 * @param k
		 * @return
		 */
		public int [][] f_character_extract(double [][]X_qz,int key_1,int k)
		{
			int m=X_qz.length;
			int n=X_qz[0].length;
			int [][]X_i_character=new int[k][n];
			int []B=new int[18*10+18];
			int[][][]A=f_rand_h(k,18*10+18,n,key_1);//������Կkey_1���ɶ�ֵ�������A�����м���
			double [][]t=new double[m][n];
			int i,j,l;
			for(i=0;i<n;i++)
	    		for(j=0;j<m;j++)
					t[j][i]=X_qz[j][i];
			
			for(i=0;i<n;i++)
			{
				for(j=1;j<=k;j++)
				{
					if(t[j][i]>=0) t[j][i]=Math.floor(t[j][i]/2)*2;
					else t[j][i]=-Math.floor(Math.abs(t[j][i])/2)*2;
				}
				//��ÿ��ͼ����ǰ18������DCTϵ��ת��Ϊ11λ�з��Ŷ�������
				double []b=new double[18];
				for(j=0;j<18;j++)
					b[j]=t[j][i];
				for(j=0;j<18;j++)
				{
					int []a;
					if(b[j]>=0)
						a=func_De_to_B(b[j],11);
					else
					{
						a=func_De_to_B(Math.abs(b[j]),11);
						a[10]=1;
					}
					System.arraycopy(a, 0, B, j*11, 11);
				}
				for(j=0;j<k;j++)
				{
					int sum=0;
					for(l=0;l<B.length;l++)
						sum+=A[j][l][i]*B[l];
					X_i_character[j][i]=sum%2;
				}
			}
			
			return X_i_character;
		}
		/**
		 * ת��Ϊ������
		 * @param a
		 * @param m
		 * @return
		 */
		public int[] func_De_to_B(double a,int m)
		{
			int []b=new int[m];
			int t=(int)a;//ת��Ϊ����
			for(int i=1;i<=m;i++)
			{
				b[m-i]=t%2;
				t=t/2;
			}
			return b;
		}
		/**
		 * ���룺��Կkey������ȡ����ˮӡǶ��λ�þ��������n����ÿ�����ˮӡ����������ͼ��ֿ��Ժ�ĳ��Ϳ�mk��nk��mk*nkΪͼ����ܸ�����
		 *�����ˮӡǶ��λ�þ���Pos����СΪn*��mk*nk))
		 * @param key
		 * @param n
		 * @param mk
		 * @param nk
		 * @return
		 */
		public int[][] F_P(int key,int n,int mk,int nk)
		{
			int [][]pos=new int[n][mk*nk];
			Random rand=new Random();
			rand.setSeed(key);
			int i,j;
			double p[][]=new double[n][mk*nk];
			for(i=0;i<n;i++)
				for(j=0;j<mk*nk;j++)
					p[i][j]=rand.nextDouble();
			for(i=0;i<n;i++)
			{
				System.arraycopy(sort(p[i]), 0, pos[i], 0, mk*nk);
			}
			return pos;
		}
		/**
		 * ð�����򣬷��������������±�
		 * @param a
		 * @return
		 */
		public int[] sort(double a[])
		{
			int b[];
			int n=a.length;
			int i,j;
			b=new int[n];
			for(i=0;i<n;i++)
				b[i]=i;
			for(i=0;i<n-1;i++)
				for(j=i+1;j<n;j++)
				{
					if(a[i]>a[j])
					{
						double temp=a[i];
						a[i]=a[j];
						a[j]=temp;
						int t=b[i];
						b[i]=b[j];
						b[j]=t;
					}
				}
			return b;
		}
		public void func_embed_color(double [][]Y_qz,double [][]U_qz,double [][]V_qz,int k1,int k4,
				double [][]Y_embed,double [][]U_embed,double[][]V_embed)
		{
			int [][]W_Y=f_character_extract(Y_qz,k1,6);//����ˮӡ
			int [][]W_U=f_character_extract(U_qz,k1,6);
			int [][]W_V=f_character_extract(V_qz,k1,6);//����V����������DCTϵ������ˮӡW_V
			int m=Y_qz.length;
			int n=Y_qz[0].length;
			int mk=m/8,nk=n/8;
			int [][]pos=F_P(k4,6,mk,nk);//����ˮӡǶ��λ�ã���Կk4����СΪ6*(mk*nk)
			int Num=6;//ÿ��ͼ������ɵ�ˮӡ������
			for(int i=0;i<mk;i++)
				for(int j=0;j<nk;j++)
				{
					int ix=i*nk+j;
					for(int k=1;k<=Num;k++)
					{
						//��ÿ��ͼ����6����ˮӡ�����Ƕ��������ͼ��������DCTϵ�������λ��YUVǶ�뷽����ͬ��
			            //Y����ˮӡǶ��
						if(Y_qz[k][pos[k-1][ix]]>=0)
							Y_qz[k][pos[k-1][ix]]=(Math.floor(Math.abs(Y_qz[k][pos[k-1][ix]])/2)*2)+W_Y[k-1][ix];
				        else
				        	Y_qz[k][pos[k-1][ix]]=-((Math.floor(Math.abs(Y_qz[k][pos[k-1][ix]])/2)*2)+W_Y[k-1][ix]);
						//U����ˮӡǶ��
						if(U_qz[k][pos[k-1][ix]]>=0)
							U_qz[k][pos[k-1][ix]]=(Math.floor(Math.abs(U_qz[k][pos[k-1][ix]])/2)*2)+W_U[k-1][ix];
				        else
				        	U_qz[k][pos[k-1][ix]]=-((Math.floor(Math.abs(U_qz[k][pos[k-1][ix]])/2)*2)+W_U[k-1][ix]);
						////V����ˮӡǶ��
						if(V_qz[k][pos[k-1][ix]]>=0)
							V_qz[k][pos[k-1][ix]]=(Math.floor(Math.abs(V_qz[k][pos[k-1][ix]])/2)*2)+W_V[k-1][ix];
				        else
				        	V_qz[k][pos[k-1][ix]]=-((Math.floor(Math.abs(V_qz[k][pos[k-1][ix]])/2)*2)+W_V[k-1][ix]);
					}
				}
			for(int i=0;i<m;i++)
				for(int j=0;j<n;j++)
				{
					Y_embed[i][j]=Y_qz[i][j];
					U_embed[i][j]=U_qz[i][j];
					V_embed[i][j]=V_qz[i][j];
				}
			
		}
		public int[][] func_verify(double [][]Y_embed,double [][]U_embed,double [][]V_embed,int k1,int k4,int m,int n)
		{
			int mk=m/8;
			int nk=n/8;
			int [][]pos=F_P(k4,6,mk,nk);
			int [][]W_Y=f_character_extract(Y_embed,k1,6);//
			int [][]W_U=f_character_extract(U_embed,k1,6);
			int [][]W_V=f_character_extract(V_embed,k1,6);//
			int Num=6;
			int [][]WYe=new int[Num][mk*nk];
			int [][]WUe=new int[Num][mk*nk];
			int [][]WVe=new int[Num][mk*nk];
			for(int i=0;i<mk;i++)
				for(int j=0;j<nk;j++)
				{
					int ix=i*nk+j;
					for(int k=1;k<=Num;k++)
					{
						WYe[k-1][ix]=(int)Math.abs((Y_embed[k][pos[k-1][ix]]))%2;
						WUe[k-1][ix]=(int)Math.abs((U_embed[k][pos[k-1][ix]]))%2;
						WVe[k-1][ix]=(int)Math.abs((V_embed[k][pos[k-1][ix]]))%2;
					}
				}
			
			return func_authentic(W_Y,W_U,W_V,WYe,WUe,WVe,pos,Num,mk,nk);
		}
		/**
		 * ˮӡǶ��
		 * @param img
		 * @param k1
		 * @param k4
		 * @return
		 */
		public static BufferedImage warter_embed(BufferedImage img,int k1,int k4)
		{
			int w=img.getWidth();
			int h=img.getHeight();
			double [][]y=new double[h][w],u=new double[h][w],v=new double[h][w];
			int size=8;//8*8
			warterMake test=new warterMake();
			test.iw=w;test.ih=h;
			test.RGBToYUV(img, y, u, v);//��ȡY��U��V����
			
			double [][]coefT=new double[8][8],coef=new double[8][8];//DCTϵ��
			test.dctCoeff(coef, 8);
			int i,j;
			for(i=0;i<8;i++)
				for(j=0;j<8;j++)
					coefT[i][j]=coef[j][i];
			//����DCT�任8*8��任
			double Y_i[][]=test.dctTrans(y, size, coef, coefT);
			double U_i[][]=test.dctTrans(u, size, coef, coefT);
			double V_i[][]=test.dctTrans(v, size, coef, coefT);
			
			double Y_q[][]=test.F_part(Y_i, size, h, w,test.Q);
			double U_q[][]=test.F_part(U_i, size, h, w,test.Q_color);
			double V_q[][]=test.F_part(V_i, size, h, w,test.Q_color);
			
			//����ziag����
			double Y_qz[][]=test.f_ziag(Y_q);
			double U_qz[][]=test.f_ziag(U_q);
			double V_qz[][]=test.f_ziag(V_q);
		
			int m=Y_qz.length;int n=Y_qz[0].length;
			double [][]Y_embed=new double[m][n],U_embed=new double[m][n],V_embed=new double[m][n];
			//ˮӡǶ��
			test.func_embed_color(Y_qz, U_qz, V_qz, k1, k4, Y_embed, U_embed, V_embed);
			
			//ziag��������
			double Y_z[][]=test.f_n_ziag(Y_embed);
			double U_z[][]=test.f_n_ziag(U_embed);
			double V_z[][]=test.f_n_ziag(V_embed);
			
			//��������
			
			double Y_m[][]=test.F_merge(Y_z, size, h, w, test.Q);
			double U_m[][]=test.F_merge(U_z, size, h, w, test.Q_color);
			double V_m[][]=test.F_merge(V_z, size, h, w, test.Q_color);
			
			//����DCT��任
			double y_e[][]=test.dctTrans(Y_m, size, coefT, coef);
			double u_e[][]=test.dctTrans(U_m, size, coefT, coef);
			double v_e[][]=test.dctTrans(V_m, size, coefT, coef);
			BufferedImage img_embed =new BufferedImage(w,h,BufferedImage.TYPE_INT_BGR);
			test.YUVToRGB(img_embed, y_e, u_e, v_e);
			
			return img_embed;
		}
		
		public static BufferedImage warter_Auth(BufferedImage img,int k1,int k4)
		{
			int w=img.getWidth();
			int h=img.getHeight();
		
			double [][]y=new double[h][w],u=new double[h][w],v=new double[h][w];
			int size=8;//8*8
			warterMake test=new warterMake();
			test.iw=w;test.ih=h;
			test.RGBToYUV(img, y, u, v);//��ȡY��U��V����
			
			double [][]coefT=new double[8][8],coef=new double[8][8];//DCTϵ��
			test.dctCoeff(coef, 8);
			int i,j;
			for(i=0;i<8;i++)
				for(j=0;j<8;j++)
					coefT[i][j]=coef[j][i];
			//����DCT�任8*8��任
			double Y_i[][]=test.dctTrans(y, size, coef, coefT);
			double U_i[][]=test.dctTrans(u, size, coef, coefT);
			double V_i[][]=test.dctTrans(v, size, coef, coefT);
			
			double Y_q[][]=test.F_part(Y_i, size, h, w,test.Q);
			double U_q[][]=test.F_part(U_i, size, h, w,test.Q_color);
			double V_q[][]=test.F_part(V_i, size, h, w,test.Q_color);
			
			//����ziag����
			double Y_qz[][]=test.f_ziag(Y_q);
			double U_qz[][]=test.f_ziag(U_q);
			double V_qz[][]=test.f_ziag(V_q);
			int DD[][]=test.func_verify(Y_qz, U_qz, V_qz, k1, k4, h, w);
			BufferedImage img_auth =new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
			for(i=0;i<h;i++)
			{
				for(j=0;j<w;j++)
				{
					if(DD[i][j]==0) img_auth.setRGB(i, j, 0);
					else img_auth.setRGB(i, j, 0xffffff);;
				}
			}
			
			return img_auth;
		}
		public void RGBToYUV(BufferedImage img,double y[][],double u[][],double v[][])
		{
			int w=img.getWidth();
			int h=img.getHeight();
			for(int i=0;i<h;i++)
				for(int j=0;j<w;j++)
				{
					int r,g,b;
					int tem=img.getRGB(i, j);
					r=(tem>>16)&0xff;
					g=(tem>>8)&0xff;
					b=tem&0xff;
					y[i][j]=0.299*r+0.587*g+0.114*b;
					u[i][j]=-0.147*r-0.289*g+0.436*b;
					v[i][j]=0.615*r-0.515*g-0.100*b;
					
				}
		}
		public void YUVToRGB(BufferedImage img,double y[][],double u[][],double v[][])
		{
			int w=y.length;
			int h=y[0].length;
			for(int i=0;i<h;i++)
				for(int j=0;j<w;j++)
				{
					int r,g,b;
					r=(int)Math.round(y[i][j]+1.140*v[i][j]);
					g=(int)Math.round(y[i][j]-0.394*u[i][j]-0.581*v[i][j]);
					b=(int)Math.round(y[i][j]+2.032*u[i][j]);
					r=r>255?255:r;g=g>255?255:g;b=b>255?255:b;
					r=r<0?0:r;g=g<0?0:g;b=b<0?0:b;
					int tem=0;
					tem=(255<<24)|(r<<16)|(g<<8)|(b);
					img.setRGB(i, j, tem);
				}
		}
		/**
		 * % Find the N9 of an image block
		 *% Input: i,the image block index
         *% Output: N,1*9 matrix,record the N9 of the ith image block
		 * @param i
		 * @return
		 */
		public int[] N_9(int i)
		{
			int []N=new int[9];
			int block=iw/8;
			int m=(int)Math.floor(i/block)+1;
			int n=i%block+1;
			int c=0;
			for(int a=-1;a<=1;a++)
				for(int b=-1;b<=1;b++)
				{
					int hui=(block+m+a-1)%block+1;
			        int kun=(block+n+b-1)%block+1;
			        N[c]=(hui-1)*block+kun-1;
			        c=c+1;
				}
			return N;
		}
	
		/**
		 * �Ķ�λ
         *���룺�ع���ˮӡ��ϢW_Y��W_U��W_V����ȡ��ˮӡ��ϢWYe��WUe��WVe��ˮӡǶ��λ��Pos��ÿ��ͼ����ˮӡ������Num��ͼ��ֿ��Ĵ�Сmk��nk
         *�����һά�۸ı�ʶ����V�����飩����ά�۸ı�ʶ����D�����飩����ά�۸ı�ʶ����DD����ͼ���С��ͬ����Y��U��V�����Ĵ۸ı�ʶ����DY��DU��DV(
         *���飩
		 * @param W_Y
		 * @param W_U
		 * @param W_V
		 * @param WYe
		 * @param WUe
		 * @param WVe
		 * @param Pos
		 * @param Num
		 * @param mk
		 * @param nk
		 */
		public int[][] func_authentic(int [][]W_Y,int [][]W_U,int [][]W_V,int [][]WYe,int [][]WUe,int [][]WVe,int [][]Pos,int Num,int mk,int nk)
		{
			int m=W_Y.length;
			int n=W_Y[0].length;
			int []VY=new int[n];
			int []VU=new int[n];
			int []VV=new int[n];
			
			//�Ƚ�ÿ������ȡ�ĺ��ع���ˮӡ�Ƿ�һ��
			int i,j;
			for(i=0;i<n;i++)
			{
				int sum=0;
				VY[i]=0;VU[i]=0;VV[i]=0;
				for(j=0;j<m;j++)
					sum+=Math.abs(W_Y[j][i]-WYe[j][i]);
				if(sum>=1) VY[i]=1;
				sum=0;
				for(j=0;j<m;j++)
					sum+=Math.abs(W_U[j][i]-WUe[j][i]);
				if(sum>=1) VU[i]=1;
				sum=0;
				for(j=0;j<m;j++)
					sum+=Math.abs(W_V[j][i]-WVe[j][i]);
				if(sum>=1) VV[i]=1;
			}
			//����ÿ��ͼ���������ڲ�һ��ͼ������
			int YM[]=new int[n];
			int UM[]=new int[n];
			int VM[]=new int[n];
			func_mark_tamper(VY,VU,VV,YM,UM,VM);
			//ͨ���Ƚ�ÿ��ͼ���������ڲ�һ�¿�������ˮӡǶ��鲻һ�¿�����λ�۸Ŀ�
			int VYl[]=new int[n];
			int VUl[]=new int[n];
			int VVl[]=new int[n];
			func_compare(YM,UM,VM,VY,VU,VV,Num,Pos,VYl,VUl,VVl);
			//�Դ۸ı�ʶ����VYl��VUl��VVl���н�һ���ж�
			int VYg[]=new int[n];
			int VUg[]=new int[n];
			int VVg[]=new int[n];
			System.arraycopy(VYl, 0, VYg, 0, n);
			System.arraycopy(VUl, 0, VUg, 0, n);
			System.arraycopy(VVl, 0, VVg, 0, n);
			for(i=0;i<n;i++)
			{
				int sum=0;
				int b[]=N_9(i);
				if(VYl[i]==1)
				{
					for(j=0;j<b.length;j++)
						sum+=VYg[b[j]];
					if((sum-VYl[i])<=2) VYl[i]=0;
				}
				else if((sum-VYl[i])>=7) VYl[i]=1;
				sum=0;
				if(VUl[i]==1)
				{
					for(j=0;j<b.length;j++)
						sum+=VUg[b[j]];
					if((sum-VUl[i])<=2) VUl[i]=0;
				}
				else if((sum-VUl[i])>=7) VUl[i]=1;
				sum=0;
				if(VVl[i]==1)
				{
					for(j=0;j<b.length;j++)
						sum+=VVg[b[j]];
					if((sum-VVl[i])<=2) VVl[i]=0;
				}
				else if((sum-VVl[i])>=7) VVl[i]=1;
			}
			int V[]=new int[n];
			for(i=0;i<n;i++)
			{
				if((VYl[i]+VUl[i]+VVl[i])>=1) V[i]=1;
				else V[i]=0;
			}
			int DD[][]=new int[mk*8][nk*8];
			for(i=0;i<mk;i++)
				for(j=0;j<nk;j++)
				{
					int ii=i*nk+j;
					for(int k=0;k<8;k++)
						for(int l=0;l<8;l++)
							DD[i*8+k][j*8+l]=V[ii];
				}
			return DD;
		}
		/**
		 * ����ÿ��ͼ���������ڲ�һ�¿�ĸ���
         *���룺����������ˮӡ��һ�¾���VY��VU��VV
         *��������������Ŀ������ˮӡ��һ�¿�������YM��UM��VM
         *N_9(i)��ʾ��i��ͼ���ľ����������
		 * @param VY
		 * @param VU
		 * @param VV
		 * @param YM
		 * @param UM
		 * @param VM
		 */
		public void func_mark_tamper(int []VY,int []VU,int []VV,
				int []YM,int []UM,int []VM)
		{
			int n=VY.length;
			for(int i=0;i<n;i++)
			{
				int b[]=N_9(i);
				int sum=0;
				for(int j=0;j<b.length;j++)
				   sum+=VY[b[j]];
				YM[i]=sum-VY[i];//�þ�������ˮӡ��һ�¿�����ȥ�鱾����ͬ
				sum=0;
				for(int j=0;j<b.length;j++)
					   sum+=VU[b[j]];
				UM[i]=sum-VU[i];
				sum=0;
				for(int j=0;j<b.length;j++)
					   sum+=VV[b[j]];
					VM[i]=sum-VV[i];
			}
		}
		
		public void func_compare(int []YM,int []UM,int []VM,int []VY,int []VU,int []VV,int Num,int [][]Pos,
				int []VYg,int []VUg,int []VVg)
		{
			int n=VY.length;
			System.arraycopy(VY, 0, VYg, 0, n);
			System.arraycopy(VU, 0, VUg, 0, n);
			System.arraycopy(VV, 0, VVg, 0, n);
			for(int i=0;i<n;i++)
			{
				if(VY[i]==1)
				{
					int s1=0;
					for(int j=0;j<Num;j++)
						if((YM[i]>=YM[Pos[j][i]])&&YM[Pos[j][i]]>0)
							s1++;//�����i��ͼ��������һ�¿������ڵ�����ӦˮӡǶ���Ĳ�һ�¿�������ˮӡǶ���Ĳ�һ�¿�������0����s1��1
					if(s1<4)//����i��ͼ��������һ�¿�������С��4��ˮӡǶ���İ�����һ�¿���Ҫ����ÿ�۸ı�ʶ��Ϊ0����ͬ
						VYg[i]=0;
				}
				if(VU[i]==1)
				{
					int s1=0;
					for(int j=0;j<Num;j++)
						if((UM[i]>=UM[Pos[j][i]])&&UM[Pos[j][i]]>0)
							s1++;//�����i��ͼ��������һ�¿������ڵ�����ӦˮӡǶ���Ĳ�һ�¿�������ˮӡǶ���Ĳ�һ�¿�������0����s1��1
					if(s1<4)//����i��ͼ��������һ�¿�������С��4��ˮӡǶ���İ�����һ�¿���Ҫ����ÿ�۸ı�ʶ��Ϊ0����ͬ
						VUg[i]=0;
				}
				if(VV[i]==1)
				{
					int s1=0;
					for(int j=0;j<Num;j++)
						if((VM[i]>=VM[Pos[j][i]])&&VM[Pos[j][i]]>0)
							s1++;//�����i��ͼ��������һ�¿������ڵ�����ӦˮӡǶ���Ĳ�һ�¿�������ˮӡǶ���Ĳ�һ�¿�������0����s1��1
					if(s1<4)//����i��ͼ��������һ�¿�������С��4��ˮӡǶ���İ�����һ�¿���Ҫ����ÿ�۸ı�ʶ��Ϊ0����ͬ
						VVg[i]=0;
				}
			}
		}
	public static void main(String[] args)
	{
	
		BufferedImage a=null;
		//�������ΪˮӡǶ�룬������ˮӡ��ͼ������bmp�ļ���jpg�ļ�����
	/*	warterMake x=new warterMake();
		try {
			a=ImageIO.read(new File("l1.jpg"));//��ȡҪ��ˮӡ��ͼ��
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedImage b=warter_embed(a,10,10);//ˮӡǶ��
		try {
			 ImageIO.write(b, "bmp",new File("t1.bmp"));//������ˮӡ��ͼ������bmp�ļ���jpg���ԣ���Ҳ��ʱ��֪��
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		//����Ϊˮӡ��ȡ����
		BufferedImage d=null;
		warterMake x=new warterMake();
		try {
	    	d=ImageIO.read(new File("t3.bmp"));//��ȡҪ��֤��ͼ��
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedImage c=warter_Auth(d,10,10);//ͼ����֤
		try {
			 ImageIO.write(c, "bmp",new File("t4.bmp"));//���ɺڰ׶�ֵͼ�񣬰�ɫ����Ϊ�۸ĵ�
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
