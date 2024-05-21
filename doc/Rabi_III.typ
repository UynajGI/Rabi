#import "@preview/physica:0.9.3": *
#import "@preview/problemst:0.1.0": pset
#import "template.typ": project

#show: pset.with(
  class: "Rabi",
  student: "江源",
  title: "III",
  date: datetime.today(),
)

#set math.equation(numbering: "(1)", supplement: [eq.])
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

= Schrieffer Wolff transformation

== Rabi Hamiltonian

The Rabi Hamiltonian is given by

$
H = omega ap am + Omega/2 sz - lambda (ap + am) sx
$

It can be rewritten as

$
H = H_0 - lambda V
$

where
$
H_0 = omega ap am + Omega/2 sz
$
and
$
V = (ap + am) sx
$.

With top four energy levels $ket(lr(-,0))$, $ket(lr(+,0))$, $ket(lr(-,1))$, $ket(lr(+,1))$, we can get the matrix form of $H_0$ as

$
H_0 = mat(-Omega/2, 0, 0, 0; 0, Omega/2, 0, 0; 0, 0, omega-Omega/2, 0; 0, 0, 0, omega+Omega/2)
$

and the matrix form of the off-diagonal part $V= (ap + am) sx$ as

$
V = mat(0, 0, 0, 1; 0, 0, 1, 0; 0, 1, 0, 0; 1, 0, 0, 0)
$

== Unitary transformation

We consider a unitary transformation $U = e^S$, where the generator $S$ should be anti-Hermitian $S^dagger=-S$. The transformed Hamiltonian can be written as

$
H' = U^dagger H U = H + [H,S] + 1/2! [[H, S],S] + dots
$

The transformed Hamiltonian can be divided into diagonal part and off-diagonal part using the fact that $S$ is block off-diagonal and $V$ is block-diagonal, and denoted as $H'_"od"$ and $H'_"d"$.

$
H'_"d" &= sum_(k=0)^infinity 1/((2k)!)[H_0,S]^((2k)) - sum_(k=0)^infinity 1/((2k+1)!)[lambda V,S]^((2k+1))\
H'_"od" &= sum_(k=0)^infinity 1/((2k+1)!)[H_0,S]^((2k+1)) - sum_(k=0)^infinity 1/((2k)!)[lambda V,S]^((2k))
$

The off-diagonal part $H'_"od"$ must be zero to diagonalize $H$. We can expand $S$ as
$
S = lambda S^((1)) + lambda^2 S^((2)) + dots
$.

So we can get the every order of $S$ by solving the equation

$
[H_0,S]+lambda V - 1/2 lambda [[V,S],S] + dots.c = 0
$<S_eq>

The $O(lambda)$ term gives

$
&[H_0,S^((1))] - V = 0\
=> &[H_0,S^((1))] = V
$<first_order>

The $O(lambda^2)$ term gives

$
[H_0,S^((2))] = 0
$<second_order>

The $O(lambda^3)$ term gives

$
&[H_0,S^((3))] - 1/2 [[V,S^((1))],S^((1))] + 1/3! [[[H_0,S^((1))],S^((1))],S^((1))] = 0\
=> &[H_0,S^((3))] = 1/3 [[V,S^((1))],S^((1))]
$<third_order>

The $O(lambda^4)$ term gives

$
&[H_0,S^((4))] - 1/2 [[V,S^((1))],S^((2))] - 1/2 [[V,S^((2))],S^((1))]=0\
=> &[H_0,S^((4))] = 0
$<fourth_order>


=== First order

The first order of $S$ can be obtained by solving the equation@first_order. Using the basis $ket(lr(z_-,n))$ and $ket(lr(z_+,m))$, we can get the matrix form of $S^((1))$ as

$
[H_0,S^((1))] &= V\
=> braket(lr(z_-,n),[H_0,S^((1))] ,lr(z_+,m)) &= braket(lr(z_-,n),V, lr(z_+,m))\
braket(lr(z_-,n),H_0 S^((1)),lr(z_+,m)) - braket(lr(z_-,n),S^((1)) H_0,lr(z_+,m)) &= braket(lr(z_-,n),V, lr(z_+,m))\
braket(lr(z_-,n),(omega ap am + Omega/2 sz) S^((1)),lr(z_+,m)) - braket(lr(z_-,n),S^((1)) (omega ap am + Omega/2 sz),lr(z_+,m)) &= braket(lr(z_-,n),V, lr(z_+,m))\

$

The first term of the left side is

$
& braket(lr(z_-,n),(omega ap am + Omega/2 sz) S^((1)),lr(z_+,m))\
= & braket(lr(z_-,n),[(omega ap am + Omega/2 sz)sum_(n',m')(ket(lr(z_-,n')) bra((lr(z_-,n'))) + ket(lr(z_+,m')) bra((lr(z_+,m')))) S^((1))],lr(z_+,m))\
= & braket(lr(z_-,n),[sum_(n',m')((omega ap am - Omega/2) ket(lr(z_-,n')) bra((lr(z_-,n'))) + (omega ap am + Omega/2)ket(lr(z_+,m')) bra((lr(z_+,m')))) S^((1))],lr(z_+,m))\
= & braket(lr(z_-,n),[sum_(n',m')((omega n' - Omega/2) ket(lr(z_-,n')) bra((lr(z_-,n'))) S^((1)) + (omega m' + Omega/2)ket(lr(z_+,m')) bra((lr(z_+,m')))S^((1))) ],lr(z_+,m))\
=&(omega n' - Omega/2) delta_(n,n') braket(lr(z_-,n'),S^((1)),lr(z_+,m))\
& = (omega n - Omega/2) braket(lr(z_-,n),S^((1)),lr(z_+,m))
$

As the same way, the second term of the left side is

$
& braket(lr(z_-,n),S^((1)) (omega ap am + Omega/2 sz),lr(z_+,m))\
= & (omega m + Omega/2) braket(lr(z_-,n),S^((1)),lr(z_+,m))
$

So the left side is

$
& braket(lr(z_-,n),(omega ap am + Omega/2 sz) S^((1)),lr(z_+,m)) - braket(lr(z_-,n),S^((1)) (omega ap am + Omega/2 sz),lr(z_+,m))\
= & (omega n - Omega/2) braket(lr(z_-,n),S^((1)),lr(z_+,m)) - (omega m + Omega/2) braket(lr(z_-,n),S^((1)),lr(z_+,m))\
= & (omega n - Omega/2 - omega m - Omega/2) braket(lr(z_-,n),S^((1)),lr(z_+,m))\
= & (omega (n - m)- Omega) braket(lr(z_-,n),S^((1)),lr(z_+,m))
$

The right side is

$
& braket(lr(z_-,n),V, lr(z_+,m))\
= & braket(lr(z_-,n),(ap + am) sx, lr(z_+,m))\
= & braket(lr(z_-,n),(ap + am), lr(z_-,m))\
= & braket(lr(z_-,n),ap, lr(z_-,m)) + braket(lr(z_-,n),am, lr(z_-,m))\
= & delta_(n,m+1) sqrt(m+1) + delta_(n,m-1) sqrt(m)
$

Summarizing the above results, we can get

$
(omega (n - m)- Omega) braket(lr(z_-,n),S^((1)),lr(z_+,m)) = delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m)\
=> braket(lr(z_-,n),S^((1)),lr(z_+,m)) = 1/(omega (n - m)- Omega) (delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m))
$<first_order_formula>

Because $Omega >> omega$, we can get

$
1/(omega (n - m)- Omega) ~ -1/Omega (1 + omega/Omega (n - m)+ O(omega^2/Omega^2))
$

So the @first_order_formula can be simplified as

$
braket(lr(z_-,n),S^((1)),lr(z_+,m)) approx -1/Omega (delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m))
$

Since the $S^((1))$ is block off-diagonal, we can get the other elements as

$
braket(lr(z_+,n),S^((1)),lr(z_-,m)) approx 1/Omega (delta_(n,m+1) sqrt(m) + delta_(n,m-1) sqrt(n))
$<first_order_S_2>



It is easy to get the operator form of $S^((1))$ as

$
S^((1)) = 1/Omega (ap+am)(sp-sm) + O(omega/Omega^2)
$

=== Second order

The second order of $S$ can be obtained by solving the equation

$
[H_0,S^((2))] = 0
$

It is easy to get the operator form of $S^((2))$ as

$
S^((2)) = 0
$

=== Third order

The third order of $S$ can be obtained by solving the equation

$
[H_0,S^((3))] = 1/3 [[V,S^((1))],S^((1))]
$<third_order_eq>

The left side is the same as the first order
as

$
(omega (n - m)- Omega) braket(lr(z_-,n),S^((3)),lr(z_+,m))
$<third_order_left>

To solve the right side, we need to calculate the commutator $[[V,S^((1))],S^((1))]$, firstly we need to calculate the commutator $[V,S^((1))]$

$
[V,S^((1))] = [(ap + am)sx, 1/Omega (ap+am)(sp-sm)]\
= 1/Omega [(ap + am)sx, ap+am](sp-sm)+ 1/Omega (ap+am)[(ap + am)sx, sp-sm]
$<V_S1_1>

We define the $sp$ and $sm$ as

$
sp = (sx + i sy)/2\
sm = (sx - i sy)/2
$

So the @V_S1_1 can be simplified as

$
[V,S^((1))] &= 1/Omega [ap + am, ap+am]sx(i sy)+ 1/Omega (ap+am)^2[sx, i sy]\
&=1/Omega (ap+am)^2 2i^2 sz\
&= -2/Omega (ap+am)^2 sz
$

The commutator $[[V,S^((1))],S^((1))]$ is

$
[[V,S^((1))],S^((1))] &= -2/Omega [(ap+am)^2 sz, 1/Omega (ap+am)(i sy)]\
&= -2/Omega^2 (ap+am)^3 [ sz, (i sy)]\
&= -2/Omega^2 (ap+am)^3 (-2i^2 sx)\
&= -4/Omega^2 (ap+am)^3 (sp+sm)\
$

So the right side of the equation is

$
1/3 [[V,S^((1))],S^((1))] = -4/(3 Omega^3) (ap+am)^3 sx
$<third_order_right>


Now, we can solve the @third_order_eq by using the @third_order_left and @third_order_right, as

$
(omega (n - m)- Omega) braket(lr(z_-,n),S^((3)),lr(z_+,m)) &= braket(lr(z_-,n),-4/(3 Omega^2) (ap+am)^3(sp+sm),lr(z_+,m)) \
&=  braket(lr(z_-,n),-4/(3 Omega^2)(ap+am)^3 (sp+sm),lr(z_+,m))\
&=  braket(lr(z_-,n),-4/(3 Omega^2)(ap+am)^3 (sm),lr(z_+,m))\
=>  braket(lr(z_-,n),S^((3)),lr(z_+,m)) &= -1/Omega braket(lr(z_-,n),-4/(3 Omega^2)(ap+am)^3 (sm),lr(z_+,m))+ O(omega/Omega^4)\
$

Like @first_order_S_2 we can get the other elements as

$
braket(lr(z_+,n),S^((3)),lr(z_-,m)) = 1/Omega braket(lr(z_+,n),-4/(3 Omega^2)(ap+am)^3 (sp),lr(z_-,m))+ O(omega/Omega^4)
$<third_order_S_2>

The operator form of $S^((3))$ is

$
S^((3)) = -4/(3 Omega^3) (ap+am)^3 (sp-sm) + O(omega/Omega^4)
$

== The transformed Hamiltonian

The transformed Hamiltonian can be written as

$
H_d' &= sum_(k=0)^infinity 1/((2k)!)[H_0,S]^((2k)) - sum_(k=0)^infinity 1/((2k+1)!)[lambda V,S]^((2k+1))\
&= [H_0,S]^((0)) + 1/(2)![H_0,S]^((2)) + 1/(4)![H_0,S]^((4)) \ &- lambda [V,S]^((1)) - 1/(3)![lambda V,S]^((3))\
=> H_d' &approx H_0 \
&+ 1/2 [H_0,lambda S^((1))]^((2)) \
&+ 1/2 [[H_0,lambda S^((1))],lambda^3 S^((3))]+ 1/2 [[H_0,lambda^3 S^((3))],lambda S^((1))]\
&+1/2 [H_0,lambda S^((1))]^((4))\
&- [lambda V,lambda S^((1))] - [lambda V,lambda^3 S^((3))]\
&- 1/3! [lambda V,lambda S^((1))]^((3))\
$<H_d_raw>

Using @first_order and @third_order, we can simplify the @H_d_raw as

$
H_d' &approx H_0 \
&+ 1/2 [H_0,lambda S^((1))]^((2)) \
&+ 1/2 [[H_0,lambda S^((1))],lambda^3 S^((3))]+ 1/2 [[H_0,lambda^3 S^((3))],lambda S^((1))]\
&+1/4! [H_0,lambda S^((1))]^((4))\
&- [lambda V,lambda S^((1))] - [lambda V,lambda^3 S^((3))]\
&- 1/3! [lambda V,lambda S^((1))]^((3))\
$


#pagebreak()

== $eta$ replace $omega/Omega$

We define $eta = Omega/omega$, $lambda=sqrt(Omega omega)/2 g$ and rewrite the transformed Hamiltonian as

$
H = H'/Omega = 1/eta ap am + 1/2 sz - 1/(2 sqrt(eta)) g sx (ap + am)
$

Now we can get the $H_0$ and $V$ as

$
H_0 = 1/eta ap am + 1/2 sz\
V = 1/(2 sqrt(eta)) sx (ap + am)
$


From @S_eq, @first_order, @second_order, @third_order, @fourth_order, we can get the $S$ as

$
[H_0,S^((1))] = V\
[H_0,S^((2))] = 0\
[H_0,S^((3))] = 1/3 [[V,S^((1))],S^((1))]\
[H_0,S^((4))] = 0\
$

=== First order

Using the basis $ket(lr(z_-,n))$ and $ket(lr(z_+,m))$, we can get the matrix form of $S^((1))$ as

$
braket(lr(z_-,n),[H_0,S^((1))],lr(z_+,m)) = braket(lr(z_-,n),V, lr(z_+,m))
$

The left side is

$
braket(lr(z_-,n),[1/eta ap am + 1/2 sz,S^((1))],lr(z_+,m))
&= braket(lr(z_-,n),[1/eta ap am, S^((1))],lr(z_+,m)) + braket(lr(z_-,n),[1/2 sz, S^((1))],lr(z_+,m))\
& = 1/eta (n-m) braket(lr(z_-,n),S^((1)),lr(z_+,m)) - braket(lr(z_-,n),S^((1)),lr(z_+,m))\
& = (1/eta (n-m)-1) braket(lr(z_-,n),S^((1)),lr(z_+,m))
$

The right side is

$
braket(lr(z_-,n),V, lr(z_+,m)) &= braket(lr(z_-,n),1/(2 sqrt(eta)) sx (ap + am), lr(z_+,m))\
&= 1/(2 sqrt(eta)) (delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m))
$

So we can get

$
(1/eta (n-m)-1) braket(lr(z_-,n),S^((1)),lr(z_+,m)) = 1/(2 sqrt(eta)) (delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m))\
=> braket(lr(z_-,n),S^((1)),lr(z_+,m)) = 1/(2 sqrt(eta) (1/eta (n-m)-1)) (delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m))
$<first_order_eta>


Because $eta >> 1$, we can expand the above formula as

$
1/(2 sqrt(eta) (1/eta (n-m)-1)) ~ -1/(2 sqrt(eta)) (1 + 1/eta (n-m)+ O(1/eta^2))
$

Choose the first order of upper formula to @first_order_eta, we can get

$
braket(lr(z_-,n),S^((1)),lr(z_+,m)) approx -1/(2 sqrt(eta)) (delta_(n,m+1) sqrt(n) + delta_(n,m-1) sqrt(m))
$

Since the $S^((1))$ is block off-diagonal, we can get the other elements as

$
braket(lr(z_+,n),S^((1)),lr(z_-,m)) approx 1/(2 sqrt(eta)) (delta_(n,m+1) sqrt(m) + delta_(n,m-1) sqrt(n))
$<first_order_eta_S_2>

It is easy to get the operator form of $S^((1))$ as

$
S^((1)) = 1/(2 sqrt(eta)) (ap+am)(sp-sm) + O(1/eta)
$

=== Second order

The operator form of $S^((2))$ is

$
S^((2)) = 0
$

=== Third order

The third order of $S$ can be obtained by solving the equation

$
[H_0,S^((3))] = 1/3 [[V,S^((1))],S^((1))]
$<third_order_eta_eq>

The left side is the same as the first order as

$
(1/eta (n-m)-1) braket(lr(z_-,n),S^((3)),lr(z_+,m))
$<third_order_eta_left>

To solve the right side, we need to calculate the commutator $[[V,S^((1))],S^((1))]$, firstly we need to calculate the commutator $[V,S^((1))]$

$
[V,S^((1))] &= [ 1/(2 sqrt(eta))  sx (ap + am), 1/(2 sqrt(eta)) (ap+am)(sp-sm)+ O(1/eta)]\
&= 1/(4 eta) (ap + am)^2 [sx , i sy] + O(1/(eta sqrt(eta)))\
&= -1/(2 eta) (ap + am)^2 sz+ O(1/(eta sqrt(eta)))
$

The commutator $[[V,S^((1))],S^((1))]$ is

$
[[V,S^((1))],S^((1))] &= [-1/(2 eta)(ap+am)^2 sz+ O(1/(eta sqrt(eta))), 1/(2 sqrt(eta)) (ap+am)(sp-sm)+ O(1/eta)]\
&= -1/(4 eta sqrt(eta)) (ap+am)^3 [ sz, i sy] + O(1/(eta^2))\
&= -1/(2 eta sqrt(eta)) (ap+am)^3 (sp+sm) + O(1/(eta^2))
$

So the right side of the equation is

$
1/3 [[V,S^((1))],S^((1))] = -1/(6 eta sqrt(eta)) (ap+am)^3 (sp+sm) + O(1/(eta^2))
$<third_order_eta_right>

Now, we can solve the @third_order_eta_eq by using the @third_order_eta_left and @third_order_eta_right, as

$
(1/eta (n-m)-1) braket(lr(z_-,n),S^((3)),lr(z_+,m)) &= braket(lr(z_-,n),-1/(6 eta sqrt(eta)) (ap+am)^3 (sp+sm)+ O(1/eta^2),lr(z_+,m)) \
&=  braket(lr(z_-,n),-1/(6 eta sqrt(eta))(ap+am)^3 (sp+sm),lr(z_+,m))+ O(1/eta^2)\
&=  braket(lr(z_-,n),-1/(6 eta sqrt(eta))(ap+am)^3 (sm),lr(z_+,m))+ O(1/eta^2)\
=>  braket(lr(z_-,n),S^((3)),lr(z_+,m)) &= -braket(lr(z_-,n),-1/(6 eta sqrt(eta))(ap+am)^3 (sm),lr(z_+,m))+ O(1/eta^2)\
$

Therefore, we can get the operator form of $S^((3))$ as

$
S^((3)) = -1/(6 eta sqrt(eta)) (ap+am)^3 (sp-sm) + O(1/eta^2)
$

== The transformed Hamiltonian

The transformed Hamiltonian can be written like @H_d_raw, but replace $omega/Omega$ by $eta$.

$
H_d' &= sum_(k=0)^infinity 1/((2k)!)[H_0,S]^((2k)) - sum_(k=0)^infinity 1/((2k+1)!)[g V,S]^((2k+1))\
&= [H_0,S]^((0)) + 1/(2)![H_0,S]^((2)) + 1/(4)![H_0,S]^((4)) \ &- g [V,S]^((1)) - 1/(3)![g V,S]^((3))\
=> H_d' &approx H_0 \
&+ 1/2 [H_0,g S^((1))]^((2)) \
&+ 1/2 [[H_0,g S^((1))],g^3 S^((3))]+ 1/2 [[H_0,g^3 S^((3))],g S^((1))]\
&+1/4! [H_0,g S^((1))]^((4))\
&- [g V,g S^((1))] - [g V,g^3 S^((3))]\
&- 1/3! [g V,g S^((1))]^((3))\
=> H_d' &approx H_0 \
&+ 1/2 g^2 [V,S^((1))] \
&+ 1/2 g^4 [V,S^((3))]+ 1/6 g^4[V,S^((1))]^((3))\
&+1/4! g^4 [V, S^((1))]^((3))\
&- g^2 [V,S^((1))] -g^4  [V,S^((3))]\
&- 1/3! g^4 [V,S^((1))]^((3))\
=> H_d' &approx H_0 \
&- 1/2 g^2 [V,S^((1))] \
&- 1/2 g^4 [V,S^((3))]\
&+1/24 g^4 [V, S^((1))]^((3))\
$

=== $[V,S^((1))]$

The commutator $[V,S^((1))]$ is

$
[V,S^((1))] &= [1/(2 sqrt(eta)) sx (ap + am), 1/(2 sqrt(eta)) (ap+am)(sp-sm)]\
&= 1/(4 eta) (ap + am)^2 [sx , i sy]\
&= -1/(2 eta) (ap + am)^2 sz
$

=== $[V,S^((3))]$

The commutator $[V,S^((3))]$ is

$
[V,S^((3))] &= [1/(2 sqrt(eta)) sx (ap + am), -1/(6 eta sqrt(eta)) (ap+am)^3 (sp-sm)]\
&= -1/(12 eta^2) (ap+am)^4 [sx , i sy]\
&= 1/(6 eta^2) (ap+am)^4 sz
$

=== $[V,S^((1))]^((3))$

The commutator $[V,S^((1))]^((3))$ is

$
[V,S^((1))]^((3)) &= [[[V,S^((1))],S^((1))],S^((1))]\
&=[-1/(2 eta sqrt(eta)) (ap+am)^3 (sp+sm) ,1/(2 sqrt(eta)) (ap+am)(sp-sm)]\
&=-1/(4 eta^2) (ap+am)^4 [sx, i sy]\
&=1/(2 eta^2) (ap+am)^4 sz\
$

=== The transformed Hamiltonian

The transformed Hamiltonian can be written as

$
H_d' &approx H_0 \
&- 1/2 g^2 [V,S^((1))] \
&- 1/2 g^4 [V,S^((3))]\
&+1/24 g^4 [V, S^((1))]^((3))\
=> H_d' &approx 1/eta ap am + 1/2 sz \
&- 1/2 g^2 (-1/(2 eta) (ap + am)^2 sz) \
&- 1/2 g^4 (1/(6 eta^2) (ap+am)^4 sz)\
&+1/24 g^4 (1/(2 eta^2) (ap+am)^4 sz)\
=> H_d' &approx 1/eta ap am + 1/2 sz \
&+ 1/(4eta) g^2  (ap + am)^2 sz+ O(1/eta^2) \
&- 1/(16 eta^2)g^4 (ap+am)^4 sz+ O(1/(eta^3))\
$


#bibliography("ref.bib")