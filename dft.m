tref = 0:0.01:63;
xref = sin(tref);
%%
t=0:63;
xc = sin(t);%w = 1 < pi无失真采样
stem(t,xc)
title('xc')
hold on
plot(tref,xref)
hold off
%% 降采样
% $$<math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mrow><mi 
% mathvariant="italic">x</mi><mrow><mo>[</mo><mrow><mi mathvariant="italic">n</mi></mrow><mo>]</mo></mrow><mo>=</mo><msub><mrow><mi 
% mathvariant="italic">x</mi></mrow><mrow><mi mathvariant="italic">c</mi></mrow></msub><mrow><mo>(</mo><mrow><mn>2</mn><msub><mrow><mi 
% mathvariant="normal">nT</mi></mrow><mrow><mi mathvariant="italic">s</mi></mrow></msub></mrow><mo>)</mo></mrow><mtext>?
% </mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mtext>?
% </mtext><mtext>?</mtext><mtext>?</mtext><mtext>?</mtext><mo>,</mo><mi mathvariant="italic">n</mi><mo>=</mo><mn>0</mn><mo>,</mo><mn>1</mn><mo>,</mo><mo>.</mo><mo>.</mo><mo>.</mo><mo>,</mo><mrow><mo>(</mo><mrow><mfrac><mrow><mi 
% mathvariant="italic">N</mi></mrow><mrow><mn>2</mn></mrow></mfrac><mo>?</mo><mn>1</mn></mrow><mo>)</mo></mrow></mrow></math>$$
%%
t1 = 0:31;
x1 = sin(2*t1);%w = 2 < pi无失真
stem(t1*2,x1)
title('降采样')
hold on
plot(tref,xref)
hold off
%% 降采样真正的离散时域

stem(t1,x1)
title('降采样真正的离散时域')
%% 增采样
%% 经过内插的增采样
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
title('经过内插的增采样 x2')
hold on
plot(tref,xref)
hold off

stem(t2,x2)
title('增采样真正的离散时域 x2')
%% 假的增采样
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
title('假的增采样')
hold on
plot(tref,xref)
hold off

stem(t3,x3)
title('假的增采样 真正的离散时域')
%% DFT
%%
X = fft(xc)
stem(t,abs(X))
title('origina')
%% 降采样的DFT
% 回归DTFT，即
% 
% $$X_d(e^{j\omega})=\frac{1}{M}\sum_{r=1}^{M-1}X(e^{j\frac{\omega-2\pi r}{M}})$$
%%
X1 = fft(x1)
%% 
% 验证DFT的关系为$<math xmlns="http://www.w3.org/1998/Math/MathML" display="inline"><mrow><msub><mrow><mi 
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
% 可见是一摸一样的。
%% 增采样的DFT
%% 真正的增采样(经过内插)
% 
%%
X2 = fft(x2)
2*X

plot(t2,abs(X2))
hold on
plot(t,abs(2*X))
hold off
legend('x_c(nT/L)','x[n]')
title('真正的增采样')
%% 假的增采样
% $$x_e[n]=\begin{cases}    x[n/L]&,n=L,2L,...\\    0&,others\end{cases}$$
%%
X3 = fft(x3)
X

stem(abs(X3),'x')
hold on
stem(abs(X))
legend('$x[\frac{n}{L}]$','x[n]')
hold off
%% 频域增减采样
%% 减采样
% 
%% 增采样
% #  没有做内插的增采样
% 
% 从时域的角度反向推导
% 
% 
%%
t4 = 0:127;
% 错误的，并不是x的周期延拓 x4 = sin(t4);
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
% 可见得到的结果却是为
% 
% 
% 
%         2.  真的增采样对应时域补零（就像时域增采样对应频域补零）
% 
% 仍然从时域得到结果（因为我们连续频域的表达式没有求）
%%
X5 = fft(xc, 2 * length(xc));  %fft(xc,127)
stem(t4/2, abs(X5))
hold on
stem(t4/2,abs(X4)/2);% 频域的这个真假增采样差了倍数？
stem(t,abs(X),'+')
legend('真的增采样','假的增采样','原始的频域')
hold off
%% 
% 确认一下反变换的时域是不是补零：
%%
x5 = ifft(X5);
stem(t4,x5,'x');
hold on
stem(t,xc)
hold off