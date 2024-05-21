#import "@preview/physica:0.9.3": *
#import "@preview/problemst:0.1.0": pset
#import "template.typ": project

#show: pset.with(
  class: "Rabi",
  student: "江源",
  title: "IV",
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

We consider the Hamiltonian of the Rabi model

$
H = omega ap am + Omega/2 sz - lambda (ap + am) sx\

$

where $lambda = sqrt(Omega omega)/2 g$. We want to perform a Schrieffer-Wolff transformation to obtain an effective Hamiltonian in the limit of $eta >> 1$.

$
H_d =  1/eta ap am  + 1/2 sz - 1/2 g/(sqrt(eta)) (ap + am) sx
$

== The transformed Hamiltonian

The transformed Hamiltonian can be written as

$
H_d' &approx 1/eta ap am + 1/2 sz \
&+ 1/(4eta) g^2  (ap + am)^2 sz+ O(1/eta^2) \
&- 1/(16 eta^2)g^4 (ap+am)^4 sz+ O(1/(eta^3))\
$


By projecting the above Hamiltonian to $H_arrow.b$, we obtain

$
H_arrow.b = 1/eta ap am - 1/2 + 1/(4eta) g^2 (ap + am)^2 - 1/(16eta^2) g^4 (ap + am)^4
$

When $eta >> 1$, $H_arrow.b$ can be further simplified with first order $O(1/eta)$ approximation

$
H_arrow.b = 1/eta ap am - 1/2 + 1/(4eta) g^2 (ap + am)^2
$


== The superradiant phase

Take the unitary transformation

$
D[alpha] = exp(alpha (ap - am))
$

where $alpha$ is a real number. The transformed Hamiltonian is

$
tilde(H) = D^dagger [alpha] H_d D[alpha] = H_d + alpha [H_d, ap - am] + 1/2 alpha^2 [H_d, [H, ap - am]]+ dots
$

We have

=== $[ap, ap - am]$

$
[ap, ap - am] = 1
$

=== $[am, ap - am]$

$
[am, ap - am] = 1
$

=== $[ap + am, ap - am]$

$
[ap + am, ap - am] = 2
$

=== $[ap am, ap - am]$

$
[ap am, ap - am] = ap + am
$

=== $[[ap am,ap - am],ap - am]$

$
[[ap am,ap - am],ap - am] = 2
$

=== $D^dagger [alpha] ap D[alpha]$

$
D^dagger [alpha] ap D[alpha] = ap + alpha
$

=== $D^dagger [alpha] am D[alpha]$

$
D^dagger [alpha] am D[alpha] = am + alpha
$

== Eigenstate

Therefore, the transformed Hamiltonian is

$
tilde(H) &= D^dagger [alpha] H_d D[alpha] \
& = D^dagger [alpha] (1/eta ap am + 1/2 sz - g 1/(2sqrt(eta)) (ap + am) sx) D[alpha] \
& = 1/eta (ap + alpha) (am + alpha)  - g/(2sqrt(eta)) (ap + am) sx + 1/2 sz - (alpha g)/sqrt(eta) sx
$


== The atomic part of the Hamiltonian

$
H_a = 1/2 sz - (alpha g)/sqrt(eta) sx
$

choose basis as $ket(sz) in {ket(arrow.t), ket(arrow.b)}$ , the corresponding Hamiltonian matrix is

$
H_a = 1/2 mat(1, 0; 0, -1) - (alpha g)/sqrt(eta) mat(0, 1; 1, 0) =  mat(1/2, -(alpha g)/sqrt(eta); -(alpha g)/sqrt(eta), -1/2)
$

The eigenvalues of $H_a$ are

$
E_{pm} = pm 1/2 sqrt(1 + 4alpha^2 g^2\/eta)
$

The eigenstates of the atomic part of the Hamiltonian, i.e. of $1/2 sz - (alpha g)/sqrt(eta) sx$

$
ket(tilde(arrow.t))&=cos(theta) ket(arrow.t) + sin(theta) ket(arrow.b)\
ket(tilde(arrow.b))&=-sin(theta) ket(arrow.t) + cos(theta) ket(arrow.b)
$

Also

$
ket(arrow.t) = cos(theta) ket(tilde(arrow.t)) - sin(theta) ket(tilde(arrow.b))\
ket(arrow.b) = sin(theta) ket(tilde(arrow.t)) + cos(theta) ket(tilde(arrow.b))

$

To evaluate this equation, we have

$
H_a ket(tilde(arrow.t)) = E_plus ket(tilde(arrow.t))\
H_a ket(tilde(arrow.b)) = E_minus ket(tilde(arrow.b))
$

Therefore, we have

$
(1/2 sz - (alpha g)/sqrt(eta) sx)ket(tilde(arrow.t)) = 1/2 sqrt(1 + 4alpha^2 g^2\/eta) ket(tilde(arrow.t))\
=> cases((1/2 cos(theta) - (alpha g)/sqrt(eta) sin(theta)) ket(arrow.t) &= 1/2 sqrt(1 + 4alpha^2 g^2\/eta) cos(theta) ket(arrow.t)\
(-1/2 sin(theta) - (alpha g)/sqrt(eta) cos(theta)) ket(arrow.b) &= 1/2 sqrt(1 + 4alpha^2 g^2\/eta) sin(theta) ket(arrow.b))\
=> (-1/2 sin(theta) - (alpha g)/sqrt(eta) cos(theta))/(1/2 cos(theta) - (alpha g)/sqrt(eta) sin(theta))=sin(theta)/cos(theta)=tan(theta)\
=> (- tan(theta) - (2 alpha g)/sqrt(eta) )/(1 - (2 alpha g)/sqrt(eta) tan(theta))=tan(theta)\
=> - tan(theta) - (2 alpha g)/sqrt(eta) = tan(theta) - (2 alpha g)/sqrt(eta) tan^2(theta)\
=> (2 tan(theta))/(1-tan^2(theta)) = tan(2 theta) = -(2 alpha g)/sqrt(eta)\
$

And, the new transition dimensionless coupling constant is defined as $gamma = 1 + 4alpha^2 g^2\/eta$

Therefore, we can obtain the new Hamiltonian with new Pauli matrices $tau_x, tau_y, tau_z$ in term of the new basis $ket(tilde(arrow.t)), ket(tilde(arrow.b))$

$
tilde(H)ket(tilde(arrow.t)) &=1/eta (ap + alpha) (am + alpha)ket(tilde(arrow.t))  - g/(2sqrt(eta)) (ap + am) sx ket(tilde(arrow.t)) + H_a ket(tilde(arrow.t))\
& = 1/eta (ap + alpha) (am + alpha)ket(tilde(arrow.t))\
& - g/(2sqrt(eta)) (ap + am) sx ket(tilde(arrow.t))\
& + E_plus ket(tilde(arrow.t))
$

We can focus on the term $- g/(2sqrt(eta)) (ap + am) sx ket(tilde(arrow.t))$

$
&- g/(2sqrt(eta)) (ap + am) sx ket(tilde(arrow.t))\
& = - g/(2sqrt(eta)) (ap + am) sx (cos(theta) ket(arrow.t) + sin(theta) ket(arrow.b))\
& = - g/(2sqrt(eta)) (ap + am)  (cos(theta) ket(arrow.b) + sin(theta) ket(arrow.t))\
& = - g/(2sqrt(eta)) (ap + am)[cos(theta) (sin(theta) ket(tilde(arrow.t))+cos(theta) ket(tilde(arrow.b))) + sin(theta) (cos(theta) ket(tilde(arrow.t))-sin(theta) ket(tilde(arrow.b)))]\
& = - g/(2sqrt(eta)) (ap + am)[ 2 cos(theta) sin(theta) ket(tilde(arrow.t)) + (cos^2(theta) - sin^2(theta)) ket(tilde(arrow.b))]\
& = - g/(2sqrt(eta)) (ap + am)[ sin(2 theta) ket(tilde(arrow.t)) + cos(2 theta) ket(tilde(arrow.b))]\
$

Therefore, the following equation is obtained

$
tilde(H)ket(tilde(arrow.t)) &=\
& = 1/eta (ap + alpha) (am + alpha)ket(tilde(arrow.t))\
& - g/(2sqrt(eta)) (ap + am)[ sin(2 theta) ket(tilde(arrow.t)) + cos(2 theta) ket(tilde(arrow.b))]\
& + E_plus ket(tilde(arrow.t))\
$

Also, we can obtain the equation for $ket(tilde(arrow.b))$

$
tilde(H)ket(tilde(arrow.b)) &=\
& = 1/eta (ap + alpha) (am + alpha)ket(tilde(arrow.b))\
& - g/(2sqrt(eta)) (ap + am)[ sin(2 theta) ket(tilde(arrow.t)) - cos(2 theta) ket(tilde(arrow.b))]\
& + E_minus ket(tilde(arrow.b))\
$


Therefore, the new Hamiltonian in the new basis $ket(tilde(arrow.t)), ket(tilde(arrow.b))$ is

$
tilde(H)(pm alpha) &= 1/eta (ap + alpha) (am + alpha) + gamma/2 tau_z  - g/(2sqrt(eta)) (ap + am) sin(2 theta) tau_z - g/(2sqrt(eta)) (ap + am) cos(2 theta) tau_x\
&=1/eta ap am + alpha^2/eta + alpha/eta (ap+am)+ gamma/2 tau_z  - g/(2sqrt(eta)) (ap + am) sin(2 theta) tau_z - g/(2sqrt(eta)) (ap + am) cos(2 theta) tau_x\
&=1/eta ap am - g/(2sqrt(eta)) (ap + am)  cos(2 theta) tau_x + gamma/2 tau_z+ alpha^2/eta + (alpha/eta- g/(2sqrt(eta)) sin(2 theta) tau_z)(ap + am)    \
$

where $gamma = 1 + 4alpha^2 g^2/eta$


Now, we require that the block-diagonal perturbation term in the above equation, $tilde(V)_d=(alpha/eta- g/(2sqrt(eta)) sin(2 theta) tau_z)(ap + am)$, vanishes upon the projection to the $H_tilde(arrow.b)$, this is, $alpha/eta+ g/(2sqrt(eta))sin(2 theta)=0$, whose nontrivial solutions are

$
alpha &= - g/2 sqrt(eta) sin(2 theta)=  (alpha g^2 sqrt(eta))/sqrt(eta + 4alpha^2 g^2)\
eta + 4alpha^2 g^2 &= g^4 eta\
alpha^2 &= ((g^4-1)eta)/(4g^2)\
alpha_g &= pm sqrt((g^4-1)eta)/(2g)
$

With the above choice of $alpha$, the block-diagonal perturbation becomes$tilde(V)_d=pm 2 alpha_g/eta (ap + am)ket(tilde(arrow.t))bra(tilde(arrow.t))$, substituting this into $gamma$, we obtain

$
gamma &= 1 + 4 alpha_g^2 g^2/eta = 1 +4 ((g^4-1)eta)/(4g^2) g^2/eta\
&= 1 + g^2 - 1 = g^2
$

And we can transform $g/(2sqrt(eta)) cos(2 theta) $

$
g/(2sqrt(eta)) cos(2 theta)  &= g/(2sqrt(eta)) (sqrt(eta))/sqrt(4 alpha_g^2 g^2+eta)\
&=  g/(2sqrt(eta)) (sqrt(eta))/sqrt(4 ((g^4-1)eta)/(4g^2) g^2+eta)\
&=  g/(2sqrt(eta)) (sqrt(eta))/sqrt((g^4-1)eta+eta)\
&=  1/(2 g sqrt(eta))\
$

Therefore, within the subspace of $H_tilde(arrow.b)$ , the effective Hamiltonian is

$
tilde(H)(pm alpha_g) = 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta
$