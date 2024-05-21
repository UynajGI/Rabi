#import "@preview/physica:0.9.3": *
#import "@preview/problemst:0.1.0": pset
#import "template.typ": project

#show: pset.with(
  class: "Rabi",
  student: "江源",
  title: "II",
  date: datetime.today(),
)

#set math.equation(numbering: "(1)", supplement: [Eq.])
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

= SVD分解和C矩阵的关系

== C矩阵到SVD分解

一个系综矩阵 $A_(N times M),(M>N)$，定义关联矩阵 $C_(M times M)=A^T_(M times N) A_(N times M)$，求得 $C$ 矩阵的特征值$lambda_i$和对应标准正交的特征向量

$
bold(v)_1, bold(v)_2, dots, bold(v)_r, bold(v)_(r+1), dots, bold(v)_M
$

其中 $r$ 是 $C$ 矩阵的秩。可以写成正交矩阵 $V_(M times M)=[V_1_(M times r), V_2_(M times M-r)]=[bold(v)_1, bold(v)_2, dots, bold(v)_r, bold(v)_(r+1), dots, bold(v)_M]$，其中 $V_1$ 是 $C$ 矩阵的前 $r$ 个特征向量，$V_2$ 是 $C$ 矩阵的后 $M-r$ 个特征向量。


根据特征值与特征向量的定义，有：

$
A^T A bold(v)_i = lambda_i bold(v)_i quad (i=1,2,dots,M)
$

考虑 $A bold(v)_i quad (i=1,2,dots,M)$，有：

$
angle.l A bold(v)_i, A bold(v)_j angle.r = bold(v)_i^T A^T A bold(v)_j = bold(v)_i^T lambda_j bold(v)_j = lambda_j bold(v)_i^T bold(v)_j= cases(lambda_i ","  1 <= i = j <= r , 0 "," i != j)
$

令 $Lambda_(M times M) = diag(lambda_1, lambda_2, dots, lambda_r, 0, dots, 0)= mat(Lambda_1_(r times r) , 0 ;0 , 0)$，设 $Sigma_1_(r times r) = sqrt(Lambda_1_(r times r))$，则有：

从而有 $A^T A V_1 = V_1 Lambda_1 = V_1 Sigma_1^2$，进一步得到

$
Sigma_1^(-1) V_1^T A^T A V_1 Sigma_1^(-1) = I
$

令 $U_1_(N times r) = A_(N times M) V_1_(M times r) lr(Sigma_1^(-1))_(r times r)$，则有 $U_1^T U_1 = I$，即 $U_1$ 是正交矩阵。可以选择$N-r$ 个正交矩阵 $U_2$，使得 $U_(N times N)=[U_1_(N times r), U_2_(N times N-r)]$ 是标准正交矩阵。

综上，

$
U^T_(N times N) A_(N times M) V_(M times M) = mat(U_1^T A V_1 , U_1^T A V_2 ; U_2^T A V_1 , U_2^T A V_2) = mat(Sigma_1 , 0 ; 0 , 0)= Sigma_(N times M)
$

即 $A = U Sigma V^T$，这就是SVD分解。

特征值$lambda_i$和$sigma_i$的关系是 $lambda_i = sigma_i^2$。

== SVD分解到C矩阵

根据SVD分解，有 $A = U Sigma V^T$

$
C = A^T A = V Sigma^T U^T U Sigma V^T = V Sigma^2 V^T\
=> C V = V Sigma^2
$

对于 $Sigma^2$ 矩阵对角线上的每一项有本征方程

$
C v_i = lambda_i v_i= sigma_i^2 v_i
$

== SVD分解到K矩阵

对于 $K = A A^T$ 矩阵，有

$
K = U Sigma V^T V Sigma^T U^T = U Sigma Sigma^T U^T = U Lambda U^T
$

对于 $Lambda$ 矩阵对角线上的每一项有本征方程

$
K u_i = lambda_i u_i= sigma_i^2 u_i
$

#pagebreak()

// 一个系综矩阵 $A_(N times M),(M>N)$ 可以分解为

// $
// A_(N times M) = U_(N times N) Lambda_(N times M) V^T_(M times M)
// $
// 其中 $U U^T = I, V V^T = I$，$Lambda$只在对角线上有元素.


// $C$矩阵定义为

// $
// C_(M times M) &= A^T_(M times N) A_(N times M) \
// & = V_(M times M) Lambda_(M times N)^T U_(N times N)^T U_(N times N) Lambda_(N times M) V_(M times M)^T \
// & = V_(M times M) Lambda_(M times M)^2 V_(M times M)^T\
//  => C V &= V Lambda^2
// $

// 对于 $Lambda^2$矩阵对角线上的每一项有本征方程

// $
// C v_i = lambda_i^2 v_i
// $

// 故 SVD 分解的特征值是 $C$ 矩阵的本征值的平方，SVD 分解的 $V$ 矩阵是 $C$ 矩阵的本征向量矩阵。

= 量子本征态

== 形式化定义


一个量子系统可以拆分为$A$和$B$两部分，分别表征系统$A$和环境$B$。系统$A$的哈密顿量为$H_A$，环境$B$的哈密顿量为$H_B$，系统和环境的相互作用哈密顿量为$H_(A B)$。系统和环境的总哈密顿量为$H = H_A + H_B + H_(A B)$，系统的基态波函数可以写为

$
ket(G)=sum_(tau=0)^M sum_(i=0)^N a_(tau i) ket(psi_tau^A)  ket(psi_i^B)
$<ground_state_wave_function_of_quantum_ema>

量子系综矩阵写为

$
A = mat(bold(s)_1, bold(s)_2, dots, bold(s)_M)
$

与 @ground_state_wave_function_of_quantum_ema 对应，得到

$
bold(s)_tau = mat(a_(tau 0); a_(tau 1); dots.v ; a_(tau N))=sum_(i=0)^N a_(tau i) ket(psi_i^B)
$

可以定义一个关联矩阵，表示系统态$tau$和$tau'$在环境作用下的关联，即

$
C_(tau tau') &= angle.l bold(s)_tau , bold(s)_(tau') angle.r= (sum_i a_(tau i) ket(psi_i^B))^dagger sum_j a_(tau' j) ket(psi_j^B)\
& = sum_i sum_j a_(tau i)^* a_(tau' j) braket(psi_i^B , psi_j^B)= sum_i sum_j a_(tau i)^* a_(tau' j) delta_(i j)\
& = sum_i a_(tau i)^* a_(tau' i)
$<quantum_incidence_matrix>


根据 SVD分解分解($A = U Sigma V^dagger$)，得到本征态的形式为

$
E = U Sigma &= A V \
=> E_k &= sum_(tau=0)^M V_(tau k) bold(s)_tau = sum_(tau=0)^M V_(tau k) sum_(i=0)^N a_(tau i) ket(psi_i^B)
$<eigen_state_of_quantum_system>





== Rabi 模型为例

Rabi 模型的哈密顿量为

$
hat(H) = omega ap am + Omega/2 sx + g (ap + am) sz
$

其中$omega$是振子的频率，$Omega$是自旋的频率，$g$是耦合系数。根据算符关系$hat(x)=1/(sqrt(2 omega)) (ap + am)$ 和 $hat(p) = -i sqrt(omega/2) (ap - am)$，可以得到

$
hat(p)^2 = - omega/2 (ap^2 + am^2 - ap am - am ap)= - omega/2 (ap^2 + am^2 - 2 ap am + 1)\
hat(x)^2 = 1/(2 omega) (ap^2 + am^2 + ap am + am ap)= 1/(2 omega) (ap^2 + am^2 + 2 ap am - 1)
$

进一步可以得到

$
2/omega hat(p)^2+ 2 omega hat(x)^2 = 4 ap am-2\
ap am = 1/2 ( hat(p)^2/omega+ omega hat(x)^2 + 1)
$

哈密顿量可以写为

$
hat(H) &=  1/2 (hat(p)^2 + omega^2 hat(x)^2 + omega) + Omega/2 sx + sqrt(2 omega) g hat(x)  sz\
hat(H)_r &= hat(H)/(Omega\/2) =1/Omega (hat(p)^2 + omega^2 hat(x)^2 + omega) + sx + 2 sqrt(2 omega)/Omega g hat(x)  sz
$<Hr>

令 $y^2 equiv omega^2/Omega hat(x)^2$，@Hr 可以写为

$
hat(H)_r  &= hat(p)^2/Omega  + y^2 + omega/Omega + sx + 2 sqrt(2 omega)/Omega g sqrt(Omega)/omega y  sz\
&= - 1/Omega partial^2/(partial x^2)  + y^2 + omega/Omega + sx + 2 g sqrt(2/(omega Omega)) y  sz\
& = - omega^2/Omega^2 partial^2/(partial y^2)  + y^2 + omega/Omega + sx + 2 g sqrt(2/(omega Omega)) y  sz
$

令 $eta equiv Omega/omega$和 $R equiv (2 g)/ sqrt(omega Omega)$，则有

$
hat(H)_r = - 1/eta partial^2/(partial y^2)  + y^2 + 1/eta + sx + sqrt(2) R y  sz
$

当 $eta -> infinity$ 时，哈密顿量可以写为

$
hat(H)_r (y) &= lim_(eta -> infinity) hat(H)_r  =  y^2 + sx + sqrt(2) R y  sz\
&=mat(y^2 + sqrt(2) R y  , 1;1, y^2 -sqrt(2)  R y )
$

哈密顿量的本征值为

$
E_(plus.minus) = y^2 plus.minus sqrt(1 + 2 R^2 y^2)
$

函数性质可知，$E_-$对应的基态位置，当 $R <= 1$ 时，基态在 $y=0$ 处，当 $R > 1$ 时，基态在

$
y = plus.minus sqrt(R^4-1)/(sqrt(2) R)
$
处

首先分析 $R <= 1$ 的情况，此时哈密顿量写为
$
hat(H)_r = mat(0, 1; 1, 0)
$

对应的本征值和本征波函数为

$
lambda_(plus.minus) = plus.minus 1\
psi_(plus.minus) = 1/sqrt(2) mat(1; plus.minus 1)= 1/sqrt(2) (ket(+)  plus.minus ket(-))
$

显然基态(环境)的本征值和本征波函数对应为

$
lambda_-=-1\
psi_- = 1/sqrt(2) mat(1; -1)= 1/sqrt(2) (ket(+)  - ket(-))
$

基态的波函数可以写为

$
ket(G) &=sum_tau sum_i a_(tau i) ket(psi_tau^A)  ket(psi_i^B)= sum_i (a_(- i)ket(-) ket(psi_i^B) + a_(+ i)ket(+) ket(psi_i^B))\
&= psi(0) (a_(- 0)ket(-) + a_(+ 0)ket(+))\
&= psi(0) (-1/sqrt(2) ket(-) + 1/sqrt(2)ket(+))\
&= psi(0)/sqrt(2) mat(1; -1)
$

其中 $psi(0)$ 是系统的基态波函数。

根据@quantum_incidence_matrix 可以得到量子本征微观态的关联矩阵为

$
C_(tau tau')^Q = sum_i a_(tau i)^* a_(tau' i)=a_(tau 0) a_(tau' 0)
$

写成矩阵形式为

$
C^Q &= mat(a_(- 0)^2, a_(- 0) a_(+ 0); a_(+ 0) a_(- 0), a_(+ 0)^2)\
&= 1/2 mat(1, -1; -1, 1)
$

对应的量子本征态为

$
ket(plus.minus)_x &= 1/sqrt(2) mat(1; plus.minus 1)\
=>V &=  1/sqrt(2) mat(1,1;1,-1)=mat(v_+,v_-)
$

与相应的本征值

$
lambda_- = 1, lambda_+ = 0
$


可能的量子本征微观态为
$
E_k &= sum_(tau=0)^M V_(tau k) sum_(i=0)^N a_(tau i) ket(psi_i^B)\
&= sum_(tau=0)^M V_(tau k)  a_(tau 0)  psi(0)\
&= psi(0)  (V_(- k)  a_(- 0)+ V_(+ k)  a_(+ 0))\
&= psi(0)  ( V_(+ k)-V_(- k) )/sqrt(2)\
=> E_(plus.minus) &= psi(0)  ( V_(+ plus.minus)-V_(- plus.minus) )/sqrt(2)= psi(0)  ( 1 minus.plus 1 )/sqrt(2)
$


当 $R > 1$ 时，哈密顿量写为

$
hat(H)_r (y_(plus.minus)) = 1/2 (R^2-R^(-2))+mat(pm sqrt(R^4-1), 1;1, mp sqrt(R^4-1))
$

对应的本征值为

$
(lambda mp sqrt(R^4-1))(lambda pm sqrt(R^4-1))-1&=0\
lambda^2 -(R^4-1)-1&=0\
lambda^2 -R^4&=0\
=> lambda_pm &= plus.minus R^2
$

基态能对应本征值为 $lambda_- = -R^2$.

考虑基态对应的本征波函数，首先考虑 $y_+$，有

$
hat(H)_r (y_+) = 1/2 (R^2-R^(-2))+mat(sqrt(R^4-1), 1;1, -sqrt(R^4-1))
$

设 $y_plus.minus$对应的本征态为

$
ket(plus.minus)^((y)) = mat(plus.minus alpha; plus.minus beta)
$

则有

$
mat(plus.minus sqrt(R^4-1), 1;1, minus.plus sqrt(R^4-1)) mat(plus.minus alpha; plus.minus beta) =-R^2 mat(alpha_(plus.minus); beta_(plus.minus))
$

为 $y_+$，有

$
cases(sqrt(R^4-1) alpha_+ + beta_+ = -R^2 alpha_+,
alpha_+ - sqrt(R^4-1) beta_+ = -R^2 beta_+)\
=> \
cases((R^4-1) alpha_+ + sqrt(R^4-1) beta_+ = -R^2 sqrt(R^4-1) alpha_+,
alpha_+ - sqrt(R^4-1) beta_+ = -R^2 beta_+)\
=> \
R^4 alpha_+= -R^2 sqrt(R^4-1) alpha_+ - R^2 beta_+\
=> \
(R^2+sqrt(R^4-1)) alpha_+ = -beta_+\
=> \
beta_+ = -(R^2+sqrt(R^4-1)) alpha_+
$

为 $y_-$，有

$
cases(-sqrt(R^4-1) alpha_- + beta_- =- R^2 alpha_-,
alpha_- + sqrt(R^4-1) beta_- =- R^2 beta_-)\
=> \
cases((R^4-1) alpha_- - sqrt(R^4-1) beta_- = R^2 sqrt(R^4-1) alpha_-,
alpha_- +sqrt(R^4-1) beta_- = -R^2 beta_-)\
=> \
R^4 alpha_-= R^2 sqrt(R^4-1) alpha_- - R^2 beta_-\
=> \
(R^2-sqrt(R^4-1)) alpha_- = -beta_-\
=> \
beta_- = -(R^2-sqrt(R^4-1)) alpha_-
$

所以

$
beta_plus.minus = -(R^2plus.minus sqrt(R^4-1)) alpha_plus.minus
$

同时，为了满足归一化条件$alpha^2_(plus.minus)+beta^2_(plus.minus)=1$，有

$
(alpha_plus.minus)^2 + (beta_plus.minus)^2 = 1\
alpha_plus.minus^2 + ((R^2-sqrt(R^4-1)) alpha_plus.minus)^2 = 1\
alpha_plus.minus^2 + (R^4 plus.minus 2 R^2 sqrt(R^4-1) + R^4-1) alpha_plus.minus^2 = 1\
(2 R^4 plus.minus 2 R^2 sqrt(R^4-1) ) alpha_plus.minus^2 = 1\
alpha_plus.minus^2 = 1/(2 R^4 plus.minus 2 R^2 sqrt(R^4-1))\
=>\
beta^2_plus.minus = (R^2plus.minus sqrt(R^4-1))/(2 R^2  )\
=>\
mat(alpha_plus.minus; beta_plus.minus) = mat(1/(sqrt(2)R sqrt(R^2 plus.minus sqrt(R^4-1)));-  sqrt(R^2plus.minus sqrt(R^4-1))/(sqrt(2)R))
$

因此，基态波函数为
$
ket(G) &= sum_tau sum_i a_(tau i) ket(psi_tau^A)  ket(psi_i^B) = sum_i (a_(- i)ket(-) ket(psi_i^B) + a_(+ i)ket(+) ket(psi_i^B))\
&= a_(- y_-) ket(-) ket(y_-) + a_(- y_+) ket(-) ket(y_+) + a_(+ y_-) ket(+) ket(y_-) + a_(+ y_+) ket(+) ket(y_+)\
&= (psi (y-y_+))/sqrt(2) mat(alpha_+; beta_+) + (psi (y-y_-))/sqrt(2) mat(alpha_-; beta_-)\
$<large_R_ground_state_wave_function>

其中 $psi(y-y_+)$ 和 $psi(y-y_-)$ 是系统的基态局域波函数，且$a_(- y_-) = 1/sqrt(2) beta_- , a_(- y_+) = 1/sqrt(2) beta_+, a_(+ y_-) = 1/sqrt(2) alpha_- , a_(+ y_+) = 1/sqrt(2) alpha_+$。


@large_R_ground_state_wave_function 可以得到量子本征微观态的关联矩阵为

$
C_(tau tau')^Q = sum_i a_(tau i)^* a_(tau' i)=a_(tau y_-) a_(tau' y_-)+a_(tau y_+) a_(tau' y_+)
$

写成矩阵形式为

$
C^Q &= mat(a_(- y_-)^2+a_(- y_+)^2, a_(- y_-)a_(+ y_-)+a_(- y_+)a_(+ y_+); a_(- y_-)a_(+ y_-)+a_(- y_+)a_(+ y_+),a_(+ y_-)^2+a_(+ y_+)^2)\
&= 1/2 mat( alpha_-^2+beta_-^2, alpha_- beta_-+alpha_+ beta_+; alpha_- beta_-+alpha_+ beta_+, alpha_+^2+beta_+^2)\
&=1/2 mat(1,-1/R^2;-1/R^2,1)
$

对应的本征值

$
lambda_(plus.minus) = 1/2(1 plus.minus 1/R^2)\
$

和本征态为

$
v_(plus.minus)= 1/sqrt(2) mat(1;plus.minus 1)\
=> V =  1/sqrt(2) mat(1,1;1,-1)=mat(v_+,v_-)
$

可能的量子本征微观态为
$
E_k &= sum_(tau=0)^M V_(tau k) sum_(i=0)^N a_(tau i) ket(psi_i^B)\
&= sum_(tau=0)^M (V_(tau k)  a_(tau y_-)  psi(y-y_-)+V_(tau k)  a_(tau y_+)  psi(y-y_+))\
&= V_(- k)  a_(- y_-)  psi(y-y_-)+V_(- k)  a_(- y_+)  psi(y-y_+)+V_(+ k)  a_(+ y_-)  psi(y-y_-)+V_(+ k)  a_(+ y_+)  psi(y-y_+)\
=> E_plus.minus&= 1/2 ( alpha_- psi(y-y_-) + alpha_+ psi(y-y_+) plus.minus beta_- psi(y-y_-) plus.minus beta_+ psi(y-y_+)  )
$

#pagebreak()

= Quantum Phase Transition and Universal Dynamics in the Rabi

== SECTION A : LOW-ENERGY EFFECTIVE HAMILTONIANS

=== Schrieffer-Wolff (SW) transformation

推导基于文献#cite(<winklerSpinorbitCouplingEffects2003>,supplement: "p.201~204")，
一个哈密顿量 $H$ 可以分为两部分 $H = H_0 + H'$，其中 $H_0$ 是我们感兴趣的部分，$H'$ 是扰动。

我们考虑一个幺正变换$U = e^S$，其中生成元$S$应该是反厄密$S^dagger=-S$的。变换后的哈密顿量可以写为

$
H' = U^dagger H U = H + [H,S] + 1/2! [[H, S],S] + dots
$

做幺正变换的目的是让哈密顿量对角化，即

#image("img/B1.png")

而原始哈密顿量可以分为三个部分，分别是对角线部分$H_0$，块对角部分$H_1$和反对称部分$H_2$。

$
H = H_0 + H_1 + H_2
$

#image("img/B2.png")

因为 $S$ 必须是非块对角的，像 $H^2$ 一样，所以 $H$ 的块对角部分 $tilde(H)_d$ 包含了 $[H^0 + H^1, S]^((j))$奇数项 和 $[H^2, S]^((j))$ 的偶数项

$
tilde(H)_d = sum_(j=0)^infinity 1/((2j)!) [H^0 + H^1, S]^((2j)) + sum_(j=0)^infinity 1/((2j+1)!) [H^2, S]^((2j+1))
$

同理，$H$ 的非块对角部分 $tilde(H)_n$ 包含了 $[H^0 + H^1, S]^((j))$ 偶数项 和 $[H^2, S]^((j))$ 的奇数项

$
tilde(H)_n = sum_(j=0)^infinity 1/((2j+1)!) [H^0 + H^1, S]^((2j+1)) + sum_(j=0)^infinity 1/((2j)!) [H^2, S]^((2j))
$

由于我们的目的是让 $H$ 对角化，所以非对角部分 $tilde(H)_n$ 必须为零，即

$
tilde(H)_n = 0\
=> sum_(j=0)^infinity 1/((2j+1)!) [H^0 + H^1, S]^((2j+1)) + sum_(j=0)^infinity 1/((2j)!) [H^2, S]^((2j)) = 0
$<non_diagonal_part_of_h>

将 $S$ 展开为 $S = S^((1)) + S^((2)) + dots$，我们可以逐次逼近$S^((j))$到$S$：

为了对应阶数，，同时方便计算，我们重新将哈密顿量写为

$
H = H_0 - lambda V
$
其中 $lambda$ 是一个小量, $H^0$ 是低阶对角的哈密顿量，$V$ 是非对角的哈密顿量。

而 $S$ 也可以写为

$
S = lambda S^((1)) + lambda^2 S^((2)) + dots
$

根据 @non_diagonal_part_of_h，我们可以得到


$
[H_0,S]+lambda V - 1/2 lambda [[V,S],S] + dots.c = 0
$

将 $lambda$ 展开到 1 阶

$
[H_0,S^((1))] = V
$

将 $lambda$ 展开到 2 阶

$
[H_0,S^((2))] = 0
$


将 $lambda$ 展开到 3 阶

$
[H_0,S^((3))] - 1/2 [[V,S^((1))],S^((1))] + 1/3! [[[H_0,S^((1))],S^((1))],S^((1))] = 0\
=> [H_0,S^((3))]= 1/3 [[V,S^((1))],S^((1))]
$
=== 求解 $S$ 的矩阵元

对于 $S$ 的矩阵元 $S_(i j)$，我们可以通过逐次求解的方式得到。首先我们可以得到 $S_(i j)$ 的一阶解

$
braket(i, [H_0,S^((1))], j) &= braket(i, V, j)\
braket(i, H_0 S^((1)), j)- braket(i, S^((1)) H_0, j) &= V_(i j)\
E_i braket(i, S^((1)), j) - E_j braket(i, S^((1)), j) &= V_(i j)\
S^((1))_(i j) &= V_(i j)/(E_i - E_j)
$

然后我们可以得到 $S_(i j)$ 的三阶解

$
braket(i, [H_0,S^((3))], j) &= 1/3 [[V,S^((1))],S^((1))]_(i j)\
braket(i, H_0 S^((3)), j)- braket(i, S^((3)) H_0, j) &= 1/3 [[V,S^((1))],S^((1))]_(i j)\
E_i braket(i, S^((3)), j) - E_j braket(i, S^((3)), j) &= 1/3 [[V,S^((1))],S^((1))]_(i j)\
S^((3))_(i j) &= 1/3 [[V,S^((1))],S^((1))]_(i j)/(E_i - E_j)
$

以此类推，我们可以得到 $S_(i j)$ 的所有阶数的解。

=== 计算 Rabi 模型的 $S^((1))$

对于 Rabi 模型，哈密顿量写为

$
H = omega ap am + Omega/2 sx + g (ap + am) sz
$

计算前四个能级\ $ket(lr(-,0))$, $ket(lr(+,0))$, $ket(lr(-,1))$, $ket(lr(+,1))$，可以得到 $H_0=omega ap am + Omega/2 sx$ 的矩阵形式为

$
H_0 = mat(-Omega/2, 0, 0, 0; 0, Omega/2, 0, 0; 0, 0, omega-Omega/2, 0; 0, 0, 0, omega+Omega/2)
$

非对角部分 $g V= g (ap + am) sz$ 的矩阵形式为

$
V = mat(0, 0, 0, 1; 0, 0, 1, 0; 0, 1, 0, 0; 1, 0, 0, 0)
$

因此 $S^((1))$ 的矩阵形式为

$
S^((1))_(i j) &= V_(i j)/(E_i - E_j)\
&= mat(0, 0, 0, -1/(omega+Omega); 0, 0, 1/(Omega-omega), 0; 0, 1/(omega-Omega), 0, 0; 1/(omega+Omega), 0, 0, 0)
$


=== A systematic method for Schrieffer-Wolff transformation and its generalizations

上文SW变换推导过于繁琐，经过查阅文献发现更加通用（但合理性待定）的方法，来自文献#cite(<haqSystematicMethodSchriefferWolff2020>).

SW变换是一种幺正变换。因此，人们选择适当的幺正算子，它既可以使哈密顿完全对角化，又可以使哈密顿达到某种期望的阶。通常这种变换的一个要求是将非对角项消去到一阶，从而满足下面的条件。

$
[S,H_0]=-H_v
$

其中$H_0$是哈密顿量的对角部分，$H_v$是哈密顿量的非对角部分，$S$是反厄米算子。那么SW变换可以写成

$
H' & = e^S H e^(-S) \
& = H_0 + H_v + [S,H_0] + [S,H_v] + 1/2! [S,[S,H_0]] + 1/2! [S,[S,H_v]]+dots.c\
& = H_0 + H_v - H_v + [S,H_v] + 1/2! [S,-H_v] + 1/2! [S,[S,H_v]]+dots.c\
& = H_0 + 1/2 [S,H_v] + 1/3 [S,[S,H_v]]+dots.c
$

因此对角化的有效哈密顿量可以写成

$
H_"eff" = H_0 + 1/2 [S,H_v]
$<effective_hamiltonian_of_sw_transformation>

进行SW变换最关键的步骤就是获得$S$，但是如上文所述，$S$的求解只能通过微扰的方式逐次求解，这样的方法在求解高阶的$S$时会变得非常复杂。因此，文献#cite(<haqSystematicMethodSchriefferWolff2020>)提出了一种更加通用的方法。

1. 首先，我们可以获取对角线哈密顿量$H_0$和非对角线哈密顿量$H_v$的对易子 $eta$

$
eta = [H_0,H_v]
$

2. 在第二步中，我们将在$η$上施加去掉非对角部分直到一阶的条件。要做到这一点，我们将不得不保持待定系数，它们将由上面的条件决定。

3. 最后计算$eta$满足关系 $[eta,H_0]=-H_v$，确定$eta$的系数，就可以得到$S$。

以上方法的优势在于，它可以直接得到$S$，而不需要逐次求解。

==== JC模型

以JC模型为例，其哈密顿量写为

$
H = omega ap am + Omega/2 sx + g (ap sm + am sp)
$

对角部分$H_0$为

$
H_0 = omega ap am + Omega/2 sx
$

非对角部分$H_v$为

$
H_v = g (ap sm + am sp)
$

则对易子$eta$为

$
eta = [H_0,H_v] &= [omega ap am + Omega/2 sx, g (ap sm + am sp)]\
& =g[omega [ap am, ap sm + am sp] + Omega/2 [sx, ap sm + am sp]]\
& = g[omega (ap sm - am sp) + Omega [ ap sm - am sp]]\
& = g[(omega+Omega) ap sm - (omega+Omega) am sp]
$

其中用到对易关系有 $[ap am,ap]=ap,quad[ap am,am]=-am,quad [sx,sp]=-2 sp,quad [sx,sm]=2 sm$.

待定$eta$的系数为

$
eta = A ap sm + B am sp
$

它满足关系$[eta,H_0]=-H_v$，即

$
[eta,H_0] = -H_v\
=> [A ap sm + B am sp, omega ap am + Omega/2 sx] = -g (ap sm + am sp)\
=> A omega [ap sm, ap am]+B omega [am sp, ap am] + (A Omega)/2 [ap sm, sx] + (B Omega)/2 [am sp, sx] = -g (ap sm + am sp)\
=> A omega (-ap sm)+B omega (am sp)-A Omega ap sm  + B Omega am sp = -g (ap sm + am sp)\
=> cases(A (omega + Omega) = g, B (omega + Omega) = -g)
$

得到

$
A = -B = g/(omega + Omega)
$

则 $S$ 为

$
S = g/(omega + Omega) (ap sm - am sp)
$

根据 @effective_hamiltonian_of_sw_transformation，可以得到低能有效哈密顿量为

$
H_"eff" &= H_0 + 1/2 [S,H_v]\
& = omega ap am + Omega/2 sx + 1/2 [g/(omega + Omega) (ap sm - am sp), g (ap sm + am sp)]\
& = omega ap am + Omega/2 sx + 1/2 g^2/(omega + Omega) [ap sm - am sp,  ap sm + am sp]\
& = omega ap am + Omega/2 sx + 1/2 g^2/(omega + Omega) [ap sm, am sp] - 1/2 g^2/(omega + Omega) [am sp, ap sm]\
& = omega ap am + Omega/2 sx +  g^2/(omega + Omega) [ap sm, am sp]\
& = omega ap am + Omega/2 sx +  g^2/(omega + Omega) (ap sm am sp - am sp ap sm)\
& = omega ap am + Omega/2 sx +  g^2/(omega + Omega) (ap am sm sp - am ap sp sm)\
& = omega ap am + Omega/2 sx +  g^2/(omega + Omega) (ap am sm sp - (1+ap am) sp sm)\
& = omega ap am + Omega/2 sx +  g^2/(omega + Omega) (ap am [sm,sp] - sp sm)\
& = omega ap am + Omega/2 sx +  g^2/(omega + Omega) (ap am sx + sx/2 -1/2 )
$

可以看到有效哈密顿量已经被对角化。

==== Rabi模型

对于Rabi模型，哈密顿量写为

$
H = omega ap am + Omega / 2 sx + g sz lr((ap + am))
$

对角部分$H_0$为

$
H_0 = omega ap am + Omega / 2 sx
$

非对角部分$H_v$为

$
H_v = g sz lr((ap + am))
$

则对易子$eta$为

$
eta = [H_0,H_v] &= [omega ap am + Omega / 2 sx, g sz lr((ap + am))]\
& = g omega sz [ap am, lr((ap + am))] + g Omega / 2  lr((ap + am)) [sx, sz]\
& = g omega sz (ap-am) - i g Omega  lr((ap + am)) sy \
$

待定$eta$的系数为

$
eta = A sz ap + B sz am + C ap sy + D am sy
$

它满足关系$[eta,H_0]=-H_v$，即

$
[eta,H_0] &= -H_v\
=> [A sz ap + B sz am + C ap sy + D am sy, omega ap am + Omega / 2 sx] &= -g sz lr((ap + am))\
 omega (A sz ap  - B sz am + C ap sy-D am sy) & \  + Omega/2 (A (2 i sy)ap+ B (2 i sy)am+C ap (-2 i sz)+ D am (-2 i sz)) &\ &= -g sz lr((ap + am))\
  omega (A sz ap  - B sz am + C ap sy-D am sy) & \  + i  Omega (A sy ap+ B sy am-C ap sz- D am sz) &\ &= -g sz lr((ap + am))\
$


合并同类项，得到

$
(omega A - i Omega C ) ap sz = - g ap sz\
(-omega B - i Omega D ) am sz = - g am sz\
(omega C + i Omega A ) ap sy = 0\
(-omega D + i Omega B ) am sy = 0\
$

后两式推导得到

$
C &= - i Omega A / omega\
D &=  i Omega B / omega\
$

代入前两式得到

$
omega A - Omega^2 A / omega  &= - g \
-omega B + Omega^2 B / omega &= - g \
=> A = -B &=(g omega )/ ( Omega^2 - omega^2)
$

则 $S$ 为

$
S &= A sz ap + B sz am + C ap sy + D am sy\
& = (g omega )/ ( Omega^2 - omega^2)  (ap - am) sz - i  (g Omega)/ ( Omega^2 - omega^2) (ap + am) sy\
$<Rabi_s>

根据 @Rabi_s，可以得到低能有效哈密顿量为

$
H_"eff" &= H_0 + 1/2 [S,H_v]\
& = omega ap am + Omega / 2 sx + 1/2 [(g omega )/ ( Omega^2 - omega^2)  (ap - am) sz - i  (g Omega)/ ( Omega^2 - omega^2) (ap + am) sy, g sz lr((ap + am))]\
& = omega ap am + Omega / 2 sx  - (g^2 omega )/ ( Omega^2 - omega^2) +(g^2 Omega)/ ( Omega^2 - omega^2)  (ap + am)^2   sx
$

#pagebreak()


#bibliography("ref1.bib")