tref = 0:0.01:63;
xref = sin(tref);
%%
t=0:63;
xc = sin(t);%w = 1 < pi��ʧ�����
stem(t,xc)
title('xc')
hold on
plot(tref,xref)
hold off
%% ������
% $$<math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mrow><mi 
% mathvariant="italic">x</mi><mrow><mo>[</mo><mrow><mi mathvariant="italic">n</mi></mrow><mo>]</mo></mrow><mo>=</mo><msub><mrow><mi 
% mathvariant="italic">x</mi></mrow><mrow><mi mathvariant="italic">c</mi></mrow></msub><mrow><mo>(</mo><mrow><mn>2</mn><msub><mrow><mi 
% mathvariant="normal">nT</mi></mrow><mrow><mi mathvariant="italic">s</mi></mrow></msub></mrow><mo>)</mo></mrow><mtext>?
% </mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?
% </mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mo>,</mo><mi mathvariant="italic">n</mi><mo>=</mo><mn>0</mn><mo>,</mo><mn>1</mn><mo>,</mo><mo>.</mo><mo>.</mo><mo>.</mo><mo>,</mo><mrow><mo>(</mo><mrow><mfrac><mrow><mi 
% mathvariant="italic">N</mi></mrow><mrow><mn>2</mn></mrow></mfrac><mo>?</mo><mn>1</mn></mrow><mo>)</mo></mrow></mrow></math>$$
%%
t1 = 0:31;
x1 = sin(2*t1);%w = 2 < pi��ʧ��
stem(t1*2,x1)
title('������')
hold on
plot(tref,xref)
hold off
%% ��������������ɢʱ��

stem(t1,x1)
title('��������������ɢʱ��')
%% ������
%% �����ڲ��������
% $$<math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mrow><mi 
% mathvariant="italic">x</mi><mrow><mo>[</mo><mrow><mi mathvariant="italic">n</mi></mrow><mo>]</mo></mrow><mo>=</mo><msub><mrow><mi 
% mathvariant="italic">x</mi></mrow><mrow><mi mathvariant="italic">c</mi></mrow></msub><mrow><mo>(</mo><mrow><mi 
% mathvariant="italic">n</mi><mfrac><mrow><msub><mrow><mi mathvariant="italic">T</mi></mrow><mrow><mi 
% mathvariant="italic">s</mi></mrow></msub></mrow><mrow><mn>2</mn></mrow></mfrac></mrow><mo>)</mo></mrow><mtext>?
% </mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?
% </mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?
% </mtext><mo>,</mo><mi mathvariant="italic">n</mi><mo>=</mo><mn>0</mn><mo>,</mo><mn>1</mn><mo>,</mo><mo>.</mo><mo>.</mo><mo>.</mo><mo>,</mo><mrow><mo>(</mo><mrow><mn>2</mn><mi 
% mathvariant="italic">N</mi><mo>?</mo><mn>1</mn></mrow><mo>)</mo></mrow></mrow></math>$$
%%
t2 = 0:127;
x2 = sin(t2/2);
stem(t2/2,x2)
title('�����ڲ�������� x2')
hold on
plot(tref,xref)
hold off

stem(t2,x2)
title('��������������ɢʱ�� x2')
%% �ٵ�������
% $$<math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mrow><mi 
% mathvariant="normal">x'</mi><mrow><mo>[</mo><mrow><mi mathvariant="italic">n</mi></mrow><mo>]</mo></mrow><mo>=</mo><mrow><mo>{</mo><mtable><mtr><mtd><mrow><mi 
% mathvariant="italic">x</mi><mrow><mo>[</mo><mrow><mfrac><mrow><mi mathvariant="italic">n</mi></mrow><mrow><mn>2</mn></mrow></mfrac></mrow><mo>]</mo></mrow></mrow></mtd><mtd><mrow><mi 
% mathvariant="italic">n</mi><mo>=</mo><mn>0</mn><mo>,</mo><mn>2</mn><mo>,</mo><mn>4</mn><mo>,</mo><mo>.</mo><mo>.</mo><mo>.</mo><mo>,</mo><mn>2</mn><mrow><mo>(</mo><mrow><mi 
% mathvariant="italic">N</mi><mo>?</mo><mn>1</mn></mrow><mo>)</mo></mrow></mrow></mtd></mtr><mtr><mtd><mrow><mn>0</mn></mrow></mtd><mtd><mrow><mi 
% mathvariant="italic">n</mi><mo>=</mo><mn>1</mn><mo>,</mo><mn>3</mn><mo>,</mo><mn>5</mn><mo>,</mo><mo>.</mo><mo>.</mo><mo>.</mo><mo>,</mo><mn>2</mn><mi 
% mathvariant="italic">N</mi><mo>?</mo><mn>1</mn></mrow></mtd></mtr></mtable></mrow></mrow></math>$$
%%

t3 = t2;
x3 = zeros(size(t3));
i = 0;
while i < 128
    x3(i+1) = xc(floor(i/2)+1);
    i= i+2;
end
stem(t3/2,x3)
title('�ٵ�������')
hold on
plot(tref,xref)
hold off

stem(t3,x3)
title('�ٵ������� ��������ɢʱ��')
%% DFT
%%
X = fft(xc)
stem(t,abs(X))
title('origina')
%% ��������DFT
% �ع�DTFT����
% 
% $$X_d(e^{j\omega})=\frac{1}{M}\sum_{r=1}^{M-1}X(e^{j\frac{\omega-2\pi r}{M}})$$
%%
X1 = fft(x1)
%% 
% ��֤DFT�Ĺ�ϵΪ$<math xmlns="http://www.w3.org/1998/Math/MathML" display="inline"><mrow><msub><mrow><mi 
% mathvariant="italic">X</mi></mrow><mrow><mi mathvariant="italic">d</mi></mrow></msub><mrow><mo>[</mo><mrow><mi 
% mathvariant="italic">k</mi></mrow><mo>]</mo></mrow><mo>=</mo><mfrac><mrow><mn>1</mn></mrow><mrow><mn>2</mn></mrow></mfrac><mrow><mo>{</mo><mrow><mi 
% mathvariant="italic">X</mi><mrow><mo>[</mo><mrow><mi mathvariant="italic">k</mi></mrow><mo>]</mo></mrow><mo>+</mo><mi 
% mathvariant="italic">X</mi><mrow><mo>[</mo><mrow><mi mathvariant="italic">k</mi><mo>?</mo><mfrac><mrow><mi 
% mathvariant="italic">N</mi></mrow><mrow><mn>2</mn></mrow></mfrac></mrow><mo>]</mo></mrow></mrow><mo>}</mo></mrow><mo>,</mo><mi 
% mathvariant="italic">k</mi><mo>=</mo><mn>0</mn><mo>,</mo><mn>1</mn><mo>,</mo><mo>.</mo><mo>.</mo><mo>.</mo><mo>,</mo><mo>(</mo><mfrac><mrow><mi 
% mathvariant="italic">N</mi></mrow><mrow><mn>2</mn></mrow></mfrac><mo>?</mo><mn>1</mn><mo>)</mo></mrow></math>$

k = 0:31;
Xr = zeros(size(k));

Xr(k+1)=1/2*(X(k+1)+X(k+1+32));
stem(abs(Xr),'x')
hold on 
stem(abs(X1))
legend('X_d[k]','0.5*(X[k]+X[k+N/2])')
hold off
%% 
% �ɼ���һ��һ���ġ�
%% ��������DFT
%% ������������(�����ڲ�)
% 
%%
X2 = fft(x2)
2*X

plot(t2,abs(X2))
hold on
plot(t,abs(2*X))
hold off
legend('x_c(nT/L)','x[n]')
title('������������')
%% �ٵ�������
% $$x_e[n]=\begin{cases}    x[n/L]&,n=L,2L,...\\    0&,others\end{cases}$$
%%
X3 = fft(x3)
X

stem(abs(X3),'x')
hold on
stem(abs(X))
legend('$x[\frac{n}{L}]$','x[n]')
hold off
%% Ƶ����������
%% ������
% 
%% ������
% #  û�����ڲ��������
% 
% ��ʱ��ĽǶȷ����Ƶ�
% 
% 
%%
t4 = 0:127;
% ����ģ�������x���������� x4 = sin(t4);
x4 = zeros(size(t4));
for i = 1:64
    x4(i) = xc(i);
end
for i = 65:128
    x4(i) = xc(i-64);
end
stem(t4,x4)
X4 = fft(x4);
stem(t4/2,abs(X4)/2,'x')
hold on 
stem(t,abs(X),'o')
legend('X4','X')
hold off

legend({'X_4/2','X'})
%% 
% �ɼ��õ��Ľ��ȴ��Ϊ
% 
% 
% 
%         2.  �����������Ӧʱ���㣨����ʱ����������ӦƵ���㣩
% 
% ��Ȼ��ʱ��õ��������Ϊ��������Ƶ��ı��ʽû����
%%
X5 = fft(xc, 2 * length(xc));  %fft(xc,127)
stem(t4/2, abs(X5))
hold on
stem(t4/2,abs(X4)/2);% Ƶ������������������˱�����
stem(t,abs(X),'+')
legend('���������','�ٵ�������','ԭʼ��Ƶ��')
hold off
%% 
% ȷ��һ�·��任��ʱ���ǲ��ǲ��㣺
%%
x5 = ifft(X5);
stem(t4,x5,'x');
hold on
stem(t,xc)
hold off