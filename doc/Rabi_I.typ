#import "@preview/physica:0.9.3": *
#import "@preview/problemst:0.1.0": pset
#import "template.typ": project

#show: pset.with(
  class: "Rabi",
  student: "江源",
  title: "I",
  date: datetime.today(),
)

#set math.equation(numbering: "(1)", supplement: [式])
#set par(first-line-indent: 2em)
#let fake-par = style(styles => {
  let b = par[#box()]
  let t = measure(b + b, styles);

  b
  v(-t.height)
})
#show heading: it => {
  it
  fake-par
}

#let deriv(num, dnm)=[$ (d num) / (d dnm) $]
#let ap=[$ hat(a)^dagger $]
#let am=[$ hat(a) $]
#let sx=[$ hat(sigma)_x $]
#let sy=[$ hat(sigma)_y $]
#let sz=[$ hat(sigma)_z $]
#let hN=[$ hat(N) $]
#let pm=[$ plus.minus $]
#let mp=[$ minus.plus $]
#let Comm(x,y) = [$ [x, y] $]
#let sp=[$ hat(sigma)_+ $]
#let sm=[$ hat(sigma)_- $]

= 背景知识

== Baker-Campbell-Hausdorff 公式

Baker-Campbell-Hausdorff 公式，又称 BCH 公式，是一个用于计算幺正变换公式，其形式如下：

$
e^lr(A) B e^lr(-A)
&= sum_(n=1)  C_n/n! \
&= B + [A, B] + frac(1, 2!) [A, [A, B]] + frac(1, 3!) [A, [A, [A, B]]] + dots.h.c
$

其中$C_0 = B$，$C_n = [A, C_(n-1)]$.

== Rabi 模型

Rabi 模型是一个描述原子与光场相互作用的模型，其哈密顿量为
$
H = omega ap am + Omega / 2 sx + g sz lr((ap + am))
$

其中第一项的物理含义是光子的能量，第二项的物理含义是原子的能级，第三项的物理含义是原子的自旋与光子的耦合.

== 幺正算符

幺正算符是一个满足$U^dagger U = I$的算符，其中$I$是单位算符，这次推导选择的幺正算符为
$
U = exp A = exp lr((lambda sz lr((am - ap))))
$
即$A = lambda sz lr((am - ap))$，其中$lambda$是一个实数.

在这个推导中，将会计算$U H U^dagger$，根据BCH 公式，有

$
U H U^dagger
&= exp lr((lambda sz lr((am - ap)))) H exp lr((-lambda sz lr((am - ap))))\
&= H + [lambda sz lr((am - ap)), H] + frac(1, 2!) [lambda sz lr((am - ap)), [lambda sz lr((am - ap)), H]] + dots.h.c
$

在这里（以及下文），$A=lambda sz lr((am - ap))$，$B=H$，$C_n$是BCH 公式中的系数.

由于哈密顿量$H$的每一项是线性相加的，因此可以分别计算每一项的变换，然后再合并.

== 常用对易关系

对于升降算符$a$和$a^dagger$，有以下对易关系：

$
[a, a^dagger] = 1
$

对于Pauli 矩阵$sx, sy, sz$，有以下对易关系：

$
[sx, sy] &= 2 upright(i) sz\
[sy, sz] &= 2 upright(i) sx\
[sz, sx] &= 2 upright(i) sy\
sx^2 = sy^2 &= sz^2 = I\
sz &= sp+sm\
sy &= i(sp-sm)
$<xyz>

同时，升降算符和Pauli 矩阵之间对易.

#pagebreak()

= 推导


== 对 $am$ 进行 $U$ 的幺正变换

在这种情况下，$B=am$

$
C_0 &= B = am\
C_1 &= [A, B] = [lambda sz lr((am - ap)), am] =lambda sz lr(([am,am]-[ap,am])) = lambda sz\
C_2 &= [A, C_1] = [lambda sz lr((am - ap)), lambda sz] = 0\
=> C_n &= 0 lr((n gt.eq 2))
$

因此，对于$a$，有

$
U am U^dagger
&= sum_n frac(C_n, n!)\
&= am + lambda sz
$<am>

它的物理意义是，对于算符$am$做了一个平移.

== 对 $ap$ 进行 $U$ 的幺正变换

在这种情况下，$B=ap$

$
C_0 &= B = ap\
C_1 &= [A, B] = [lambda sz lr((am - ap)), ap] = lambda sz lr(([am,ap]-[ap,ap])) = lambda sz\
C_2 &= [A, C_1] = [lambda sz lr((am - ap)), lambda sz] = 0\
=> C_n &= 0 lr((n gt.eq 2))
$

因此，对于$ap$，有

$
U ap U^dagger
&= sum_n frac(C_n, n!)\
&= ap + lambda sz
$<ap>

== 对 $sx$ 进行 $U$ 的幺正变换

在这种情况下，$B=sx$

$
C_0 &= B \
&= sx\
C_1 &= [A, B] = [lambda sz lr((am - ap)), sx] = lambda (am - ap) [sz, sx] \
&= 2 i lambda sy (am - ap) \
C_2 &= [A, C_1] = [lambda sz lr((am - ap)), 2 i lambda sy (am - ap)] \
&= 2i lambda^2 (am - ap)^2 [sz,sy]\
&=4 lambda^2 sx (am - ap)^2 \
C_3 &= [A, C_2] = [lambda sz lr((am - ap)), 4 lambda^2 sx (am - ap)^2] \
&= 4 lambda^3 (am - ap)^3 [sz,sx] \
&= 8 i lambda^3 sy (am - ap)^3\
C_4 &= [A, C_3] = [lambda sz lr((am - ap)), 8 i lambda^3 sy (am - ap)^3] \
&= 8 i lambda^4 (am - ap)^4 [sz,sy] \
&= 16 lambda^4 sx (am - ap)^4\
C_n &= dots.h.c
$

可以总结出

$
U sx U^dagger
&= sum_n frac(C_n, n!)\
&= sx + 2/1! i lambda sy (am - ap) + 4/2! lambda^2 sx (am - ap)^2 +\
& 8/3! i lambda^3 sy (am - ap)^3 + 16/4! lambda^4 sx (am - ap)^4 + dots.h.c\
&= sum_(n=0) lr(
  [sx frac((2 lambda (am - ap))^(2 n), 2 n!)  + i sy frac((2 lambda (am - ap))^(2 n + 1), (2 n + 1)!) ]
)\
&= sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))
$

因此，对于$sx$，有

$
U sx U^dagger
&= sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))
$<sx>



== 对 $sz$ 进行 $U$ 的幺正变换

在这种情况下，$B=sz$

$
C_0 &= B \
&= sz\
C_1 &= [A, B] = [lambda sz lr((am - ap)), sz] = lambda (am - ap) [sz, sz] \
&= 0\
C_n &= 0 lr((n gt.eq 1))
$

因此，对于$sz$，有

$
U sz U^dagger
&= sum_n frac(C_n, n!)\
&= sz
$

#pagebreak()

= 对 $H$ 进行 $U$ 的幺正变换

对于哈密顿量$H$，可以分解为三个部分

$
H = omega ap am + Omega / 2 sx + g sz lr((ap + am))
$

分别求解

$
H_1 = omega ap am\
H_2 = Omega / 2 sx\
H_3 = g sz lr((ap + am))
$

== 对 $H_1$ 进行 $U$ 的幺正变换

可以通过幺正算符$U^dagger U = I$的性质和 @am 和 @ap 的结果求解

$
U H_1 U^dagger
&= U omega ap am U^dagger\
&= omega U ap U^dagger U am U^dagger\
&= omega (ap + lambda sz) (am + lambda sz)\
&= omega ap am  + omega lambda sz (am + ap) + omega lambda^2
$

== 对 $H_2$ 进行 $U$ 的幺正变换

根据 @sx 的结果，可以求解

$
U H_2 U^dagger
&= U Omega / 2 sx U^dagger\
&= Omega / 2 lr(
  [sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))]
)
$

== 对 $H_3$ 进行 $U$ 的幺正变换

根据 @am 和 @ap 的结果求解

$
U H_3 U^dagger
&= U g sz lr((ap + am)) U^dagger\
&= g sz (U ap U^dagger + U am U^dagger)\
&= g sz (ap+ lambda sz + am + lambda sz)\
&= g sz (ap + am) + 2 g lambda
$


== 合并得到

将以上结果合并，得到

$
tilde(H)=U H U^dagger &= U H_1 U^dagger + U H_2 U^dagger + U H_3 U^dagger\
&= omega ap am  + omega lambda sz (am + ap) + omega lambda^2 +\
& Omega / 2 lr(
  [sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))]
) +\
& g sz (ap + am) + 2 g lambda\
& = omega ap am  + (omega lambda + g) sz (am + ap) + (omega lambda^2 + 2 g lambda) + \
& Omega / 2 lr(
  [sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))]
)
$<H>

至此，推导结束.

#pagebreak()

= 连带拉盖尔多项式

连带拉盖尔多项式是一个用于求解量子力学问题的数学工具，其定义如下：

$
L_n^mu (x) &= sum_(i=0)^infinity (-1)^i (n+mu)! / lr( (n-i)! (mu+i)!) x^i/i!\
&=(n+mu)!/lr(n!) sum_(i=0)^infinity (-1)^i lr(n!)/lr( (n-i)! (mu+i)!) x^i/i!\
$

== BHC 公式的另一个形式

BHC 公式的另一个形式如下：

$
e^lr(A) e^lr(B) = e^lr(A + B + frac(1, 2) [A, B] + frac(1, 12) [A, [A, B]] - frac(1, 12) [B, [A, B]] + dots.h.c)
$

当$[A, [A, B]] = [B, [A, B]] = 0$时，BHC 公式的另一个形式可以简化为

$
e^lr(A + B) = e^lr(A) e^lr(B) e^lr(- frac(1, 2) [A, B])
$

== 展开 $sinh quad cosh$项

先要解决一个问题，升降算符的幂乘积的问题，即 $(ap)^m (am)^n$ 的简化问题，首先定义算符 $hN = ap am$。它与 $ap$ 和 $am$ 的对易关系为

$
[hN, ap] = [ap am, ap] = ap am ap - ap ap am = ap [am, ap] = ap\
[hN, am] = [ap am, am] = ap am am - am ap am =  am [ap, am] = - am
$

先让 $m >= n$，有
$
(ap)^m (am)^n &= underbrace(ap ap ap dots ap,"m") overbrace(am am am dots am,"n") \
& = underbrace(ap ap ap dots ap,"m-1") hN overbrace(am am am dots am,"n-1")\
& = underbrace(ap ap ap dots ap,"m-1") am (hN-1) overbrace(am am am dots am,"n-2")\
& = underbrace(ap ap ap dots ap,"m-2") hN (hN-1) overbrace(am am am dots am,"n-2")\
& = underbrace(ap ap ap dots ap,"m-2") hN(a (hN-1)-a) overbrace(am am am dots am,"n-3")\
& = underbrace(ap ap ap dots ap,"m-2") hN a (hN-2) overbrace(am am am dots am,"n-3")\
& = underbrace(ap ap ap dots ap,"m-2") a (hN-1)(hN-2) overbrace(am am am dots am,"n-3")\
& = underbrace(ap ap ap dots ap,"m-3") hN(hN-1)(hN-2) overbrace(am am am dots am,"n-3")\
& = dots.h.c
$

可以总结出规律，即 $(ap)^m (am)^n = (ap)^(m-n) hN(hN-1)...(hN-n+1)$，其中 $hN = ap am$，令连乘项为函数 $h_n (hN) = hN(hN-1)...(hN-n+1)$.

对于 $m < n$ 的情况，同样可以得到 $(ap)^m (am)^n =  h_m (hN) am^(n-m)$。



=== 展开 $cosh$ 项

令 $nu =-2 lambda $，@H 的 $cosh$ 项可以展开为

$
cosh lr((nu (ap - am))) &= 1/2 (e^(nu (ap - am)) + e^(-nu (ap - am)))\
&= 1/2 (e^(nu ap) e^(-nu am) e^(-1/2 [nu ap, -nu am]) + e^(-nu ap) e^(nu am) e^(-1/2 [-nu ap, nu am]))\
&= 1/2 (e^(nu ap) e^(-nu am) e^(-nu^2/2) + e^(-nu ap) e^(nu am)  e^(-nu^2/2))\
&= 1/2  e^(-nu^2/2)  (e^(nu ap) e^(-nu am) + e^(-nu ap) e^(nu am))\
&= 1/2  e^(-nu^2/2)  sum_(m,n)^infinity 1/(m!n!)[nu^m (-nu)^n + (-nu)^m nu^n] (ap)^m am^n\
$

这里我们先假定了$[A, [A, B]] = [B, [A, B]] = 0$，实际情况
$
[A,B]=[nu ap, -nu am]=nu^2 equiv "常数"
$
常数与任何算符对易，假定成立.

对于 $m - n = 2k >= 0$ 的情况（由于 $cosh$只有偶次幂项），有

$
I_x^+ &= 1/2  e^(-nu^2/2)  sum_(m,n)^infinity 1/(m!n!)[nu^m (-nu)^n + (-nu)^m nu^n] (ap)^m am^n\
&= 1/2  e^(-nu^2/2)  sum_(k=0)^infinity sum_(n=0)^infinity 1/lr((2k+n)! n!) [nu^(n+2k) (-nu)^n + (-nu)^(n+2k) nu^n] (ap)^(n+2k) am^n\
&= 1/2  e^(-nu^2/2)  sum_(k=0)^infinity sum_(n=0)^infinity lr( (-)^n h_(n)(hN))/lr((2k+n)! n!) 2nu^(2n+2k) (ap)^(2k) \
&= e^(-nu^2/2)  sum_(k=0)^infinity (ap)^(2k) nu^(2k) sum_(n=0)^infinity lr( (-)^n h_(n)(hN))/lr((2k+n)! n!) nu^(2n)\
&= e^(-nu^2/2)  sum_(k=0)^infinity (ap)^(2k) nu^(2k) sum_(n=0)^infinity lr( (-)^n hN!)/lr((2k+n)!(hN-n)!) (nu^2)^n/n!\
&= e^(-nu^2/2)  sum_(k=0)^infinity (ap)^(2k) nu^(2k) hN!/((hN+2k)!) sum_(n=0)^infinity lr( (-)^n (hN+2k)!)/lr((2k+n)!(hN-n)!) (nu^2)^n/n!\
&= e^(-nu^2/2)  sum_(k=0)^infinity (ap)^(2k) nu^(2k) hN!/((hN+2k)!) L_hN^(2k)(nu^2)\
$


对于 $n - m = 2k >= 0$ 的情况，有

$
I_x^- &= 1/2  e^(-nu^2/2)  sum_(m,n)^infinity 1/(m!n!)[nu^m (-nu)^n + (-nu)^m nu^n] (ap)^m am^n\
&= 1/2  e^(-nu^2/2)  sum_(k=0)^infinity sum_(m=0)^infinity 1/lr((m+2k)! 2k!) [nu^(m+2k) (-nu)^m + (-nu)^(m+2k) nu^m] (ap)^m am^(m+2k)\
&= 1/2  e^(-nu^2/2)  sum_(k=0)^infinity sum_(m=0)^infinity lr( (-)^m h_(m)(hN))/lr((m+2k)! 2k!) 2nu^(m+2k) (ap)^m am^(m+2k)\
&= e^(-nu^2/2)  sum_(k=0)^infinity  nu^(2k) sum_(m=0)^infinity lr( (-)^m h_(m)(hN))/lr((m+2k)! 2k!) nu^m am^(2k)\
&= e^(-nu^2/2)  sum_(k=0)^infinity  nu^(2k) sum_(m=0)^infinity lr( (-)^m hN!)/lr((m+2k)!(hN-m)!) (nu^2)^m/m! am^(2k)\
&= e^(-nu^2/2)  sum_(k=0)^infinity  nu^(2k) hN!/((hN+2k)!) sum_(m=0)^infinity lr( (-)^m (hN+2k)!)/lr((m+2k)!(hN-m)!) (nu^2)^m/m! am^(2k)\
&= e^(-nu^2/2)  sum_(k=0)^infinity  nu^(2k) hN!/((hN+2k)!) L_hN^(2k)(nu^2) am^(2k)\
$

定义一个函数

$
f(nu, hN,m ) = e^(-nu^2/2) nu^m hN!/((hN+m)!) L_hN^m (nu^2)
$

可以得到

$
I_x^+ = sum_(k=0)^infinity  (ap)^(2k)  f(nu, hN, 2k)\
I_x^- = sum_(k=0)^infinity  f(nu, hN, 2k) am^(2k)\
$

总结得到

$
cosh lr((nu (am - ap))) = I_x^+ + I_x^- = f(nu, hN, 0) + sum_(k=1)^infinity [(ap)^(2k) f(nu, hN, 2k)+ f(nu, hN, 2k) am^(2k)].
$

=== 展开 $sinh$ 项

同理，对于 $sinh$ 项，有

$
sinh lr((nu (am - ap))) &= sum_(k=0)^infinity [(ap)^(2k+1) f(nu, hN, 2k+1) - f(nu, hN, 2k+1) am^(2k+1)].
$

#pagebreak()

= $tilde(H)$的绝热形式

$
tilde(H) & = omega ap am  + (omega lambda + g) sz (am + ap) + (omega lambda^2 + 2 g lambda) + \ & Omega / 2 lr([sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))])
$

首先，令 $lambda = -g/omega$，有

$
tilde(H)
& = omega ap am  + (omega * (-g/omega) + g) sz (am + ap) + (omega (-g/omega)^2 + 2 g *(-g/omega)) + \
& Omega / 2 lr([sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))])\
& = omega ap am - g^2/omega + Omega / 2 lr([sx cosh lr((2 lambda (am - ap))) + i sy sinh lr((2 lambda (am - ap)))])\
$

绝热近似只取 $ Omega / 2$ 的展开零阶项，即

$
tilde(H)_(A A) &approx omega ap am - g^2/omega + Omega / 2 sx f(-2 lambda,hN,0)\
&=mat(
  omega ap am - g^2/omega , Omega / 2 f(-2 lambda,hN,0) ;
  Omega / 2 f(-2 lambda,hN,0), omega ap am - g^2/omega
)
$

求本征值，有

$
E^(pm,N)_(A A) = omega ap am - g^2/omega pm Omega / 2 f(-2 lambda,hN,0)
$

本征函数为

$
ket(tilde(Psi)^(pm,N)_(A A)) = ket(pm_x \, N)
$

#pagebreak()

= 广义旋转波近似

取一阶项 $f(-2 lambda,hN,1)$

哈密顿量写为

$
tilde(H)_lr(G R W A) &= tilde(H)_(A A)+ Omega/2 [i sy ap f(-2 lambda,hN,1)+ dots.h.c]
$

根据 @xyz 可以简化为

$
tilde(H)_lr(G R W A) &approx tilde(H)_(A A) - Omega/2 [(sp-sm) ap f(-2 lambda,hN,1)- (sp-sm) f(-2 lambda,hN,1) am]\
$

做旋转波近似

$
tilde(H)_lr(G R W A) &approx tilde(H)_(A A) + Omega/2 [sm ap f(-2 lambda,hN,1) + sp f(-2 lambda,hN,1) am]\
$




$ap \, am$对本征函数的作用：

$
ap ket(N) = sqrt(N+1) ket(N+1)\
am ket(N) = sqrt(N) ket(N-1)\
$


用 $ket(pm_x\, N)$ 作为本征函数求它的非对角矩阵元有

$
bra(-_x \, N) Omega/2 sm ap f(-2 lambda,hN,1) ket(+_x \, N-1)&=Omega/2  f(-2 lambda,N-1,1) bra(-_x \, N) sm ap ket(+_x \, N-1)\
&=Omega/2 sqrt(N) f(-2 lambda,N-1,1)  bra(-_x \, N) sm  ket(+_x \, N)\
&=Omega/2 sqrt(N) f(-2 lambda,N-1,1) dot braket(-_x \, N,-_x \, N)\
&=Omega/2 sqrt(N) f(-2 lambda,N-1,1)\

bra(+_x \, N-1) Omega/2 sp  f(-2 lambda,hN,1) am ket(-_x \, N)
&= Omega/2  sqrt(N) bra(+_x \, N-1) sp f(-2 lambda,hN,1) ket(-_x \, N-1)\
&= Omega/2  sqrt(N) f(-2 lambda,N-1,1) bra(+_x \, N-1) sp ket(-_x \, N-1)\
&= Omega/2  sqrt(N) f(-2 lambda,N-1,1) dot braket(+_x \, N-1,+_x \, N-1)\
&= Omega/2  sqrt(N) f(-2 lambda,N-1,1)\
$

块矩阵元为

$
tilde(H)_"GRWA"^"BLOCK" = mat(
  E^(+_x,N-1)_(A A) , Omega/2 sqrt(N) f(-2 lambda,N-1,1) ;
  Omega/2 sqrt(N) f(-2 lambda,N-1,1) , E^(-_x,N)_(A A)
)
$

本征值求解得到

$
E^(pm,N)_"GRWA" &= 1/2 [E^(+_x,N-1)_(A A)+E^(-_x,N)_(A A) \ &pm sqrt(4 dot (Omega/2 sqrt(N) f(-2 lambda,N-1,1))^2+(E^(+_x,N-1)_(A A)-E^(-_x,N)_(A A))^2)]
$


对应文献#cite(label("irishGeneralizedRotatingWaveApproximation2007"))的参数，有

$
g->lambda \, quad lambda-> lambda/ omega_0 quad N->N+1
$

文献#cite(label("irishGeneralizedRotatingWaveApproximation2007"))的形式为
#image("img/his.png")


我们的形式为
#image("img/mine.png")

每项完全一致，认为我们的推导是正确的.

令 $omega_0 = 3/4 Omega$，绘制不同能级$E/Omega$的图像

#figure(image("./img/GRWA.png", width: 80%),
  caption: [
    广义旋转波近似下不同能级的能量图像,\
    虚线为 GRWA 近似的结果，实线为数值解的结果\
    选择参数关系 $omega_0 = 0.75 Omega$
  ],)

#figure(image("img/GRWA_ref.png",width: 80%),caption: "文献[1]的结果")


#pagebreak()


#bibliography("ref.bib")