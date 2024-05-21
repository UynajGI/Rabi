#import "@preview/physica:0.9.3": *
#import "@preview/problemst:0.1.0": pset
#import "template.typ": project

#show: pset.with(
  class: "Rabi",
  student: "江源",
  title: "V",
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

= The effective Hamiltonian

The effective Hamiltonian is

$
tilde(H)_(tilde(arrow.b)) (pm alpha_g) = 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta
$

where $eta = Omega/omega$, $alpha_g = pm sqrt((g^4-1)eta)/(2g)$, and $tau_x, tau_y, tau_z$ are the Pauli matrices of the new basis $ket(tilde(arrow.t)), ket(tilde(arrow.b))$.

the new basis $ket(tilde(arrow.t)), ket(tilde(arrow.b))$ is defined as

$
ket(tilde(arrow.t))&=cos(theta) ket(arrow.t) + sin(theta) ket(arrow.b)\
ket(tilde(arrow.b))&=-sin(theta) ket(arrow.t) + cos(theta) ket(arrow.b)
$

where $theta$ is the angle defined as $tan(2 theta) = -(2 alpha g)/sqrt(eta)$


= Eigen Microstate Definition

// 翻译英语

The Hamiltonian of a quantum system can be divided into two parts, denoted as $A$ and $B$, representing the system $A$ and the environment $B$. The Hamiltonian of system $A$ is $H_A$, the Hamiltonian of environment $B$ is $H_B$, and the interaction Hamiltonian between system and environment is $H_(A B)$. The total Hamiltonian of system and environment is $H = H_A + H_B + H_(A B)$, and the ground state wave function of the system can be written as

$
ket(G)=sum_(tau=0)^M sum_(i=0)^N a_(tau i) ket(psi_tau^A)  ket(psi_i^B)
$<ground_state_wave_function_of_quantum_ema>

The quantum ensemble matrix is written as

$
A = mat(bold(s)_1, bold(s)_2, dots, bold(s)_M)
$

With the corresponding @ground_state_wave_function_of_quantum_ema, we have


$
bold(s)_tau = mat(a_(tau 0); a_(tau 1); dots.v ; a_(tau N))=sum_(i=0)^N a_(tau i) ket(psi_i^B)
$

We can define an incidence matrix, which represents the correlation between the system states $tau$ and $tau'$ under the action of the environment, that is

$
C_(tau tau') &= angle.l bold(s)_tau , bold(s)_(tau') angle.r= (sum_i a_(tau i) ket(psi_i^B))^dagger sum_j a_(tau' j) ket(psi_j^B)\
& = sum_i sum_j a_(tau i)^* a_(tau' j) braket(psi_i^B , psi_j^B)= sum_i sum_j a_(tau i)^* a_(tau' j) delta_(i j)\
& = sum_i a_(tau i)^* a_(tau' i)
$<quantum_incidence_matrix>

The quantum ensemble matrix $A$ can be decomposed into $U Sigma V^dagger$, and the eigenstate is

$
E = U Sigma &= A V \
=> E_k &= sum_(tau=0)^M V_(tau k) bold(s)_tau = sum_(tau=0)^M V_(tau k) sum_(i=0)^N a_(tau i) ket(psi_i^B)
$<eigen_state_of_quantum_system>


= Rabi Eigen Microstate

The grand state effective Rabi Hamiltonian is

$
tilde(H)_(tilde(arrow.b)) (pm alpha_g) = 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta
$

Use the original basis $ket(arrow.t), ket(arrow.b)$, they can be expressed as

$
ket(arrow.t)&=cos(theta) ket(tilde(arrow.t)) - sin(theta) ket(tilde(arrow.b))\
ket(arrow.b)&=sin(theta) ket(tilde(arrow.t)) + cos(theta) ket(tilde(arrow.b))
$


we can get the matrix representation of the effective Hamiltonian

The term of $tilde(H)_(arrow.t arrow.t)$ is

$
bra(arrow.t) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.t) &=bra(arrow.t) 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta ket(arrow.t)\
&=(1/eta ap am+alpha_g^2/eta) +bra(arrow.t) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.t)
$

Focus on the second term

$
bra(arrow.t) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.t) \
=(cos(theta) bra(tilde(arrow.t)) - sin(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z)(cos(theta) ket(tilde(arrow.t)) - sin(theta) ket(tilde(arrow.b)))\
=(cos(theta) bra(tilde(arrow.t)) - sin(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)(cos(theta) ket(tilde(arrow.b)) - sin(theta) ket(tilde(arrow.t))) + g^2/2 (cos(theta) ket(tilde(arrow.t)) + sin(theta) ket(tilde(arrow.b))))\
=1/(2 g sqrt(eta)) (ap + am) (cos (theta) sin(theta) + sin(theta) cos(theta)) + g^2/2 (cos(theta) cos(theta) - sin(theta) sin(theta))\
=1/(2 g sqrt(eta)) (ap + am) sin(2 theta) + g^2/2 cos(2 theta)\
$

So the tern of $H_(arrow.t arrow.t)$ is

$
bra(arrow.t) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.t) = 1/eta ap am+alpha_g^2/eta + 1/(2 g sqrt(eta)) (ap + am) sin(2 theta) + g^2/2 cos(2 theta)
$

The term of $tilde(H)_(arrow.b arrow.b)$ is

$
bra(arrow.b) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.b) &=bra(arrow.b) 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta ket(arrow.b)\
&=(1/eta ap am+alpha_g^2/eta) +bra(arrow.b) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.b)
$

Focus on the second term

$
bra(arrow.b) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.b) \
=(sin(theta) bra(tilde(arrow.t)) + cos(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z)(sin(theta) ket(tilde(arrow.t)) + cos(theta) ket(tilde(arrow.b)))\
=(sin(theta) bra(tilde(arrow.t)) + cos(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)(sin(theta) ket(tilde(arrow.b)) + cos(theta) ket(tilde(arrow.t))) + g^2/2 (sin(theta) ket(tilde(arrow.t)) - cos(theta) ket(tilde(arrow.b)))\
=-1/(2 g sqrt(eta)) (ap + am) (sin (theta) cos(theta) + cos(theta) sin(theta)) + g^2/2 (sin(theta) sin(theta) - cos(theta) cos(theta))\
=-1/(2 g sqrt(eta)) (ap + am) sin(2 theta) - g^2/2 cos(2 theta)\
$

So the tern of $tilde(H)_(arrow.t arrow.b)$ is

$
bra(arrow.t) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.b) = bra(arrow.t) 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta ket(arrow.b)\
= (1/eta ap am+alpha_g^2/eta) + bra(arrow.t) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.b)
$

Focus on the second term

$
bra(arrow.t) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.b) \
=(cos(theta) bra(tilde(arrow.t)) - sin(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z)(sin(theta) ket(tilde(arrow.t)) + cos(theta) ket(tilde(arrow.b)))\
=(cos(theta) bra(tilde(arrow.t)) - sin(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)(sin(theta) ket(tilde(arrow.b)) + cos(theta) ket(tilde(arrow.t))) + g^2/2 (sin(theta) ket(tilde(arrow.t)) - cos(theta) ket(tilde(arrow.b)))\
=-1/(2 g sqrt(eta)) (ap + am) (cos (theta) cos(theta) - sin(theta) sin(theta)) + g^2/2 (sin(theta) cos(theta) + cos(theta) sin(theta))\
=-1/(2 g sqrt(eta)) (ap + am) cos(2 theta) + g^2/2 sin(2 theta)\
$

So the tern of $tilde(H)_(arrow.t arrow.b)$ is

$
bra(arrow.t) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.b) = 1/eta ap am+alpha_g^2/eta - 1/(2 g sqrt(eta)) (ap + am) cos(2 theta) + g^2/2 sin(2 theta)
$

The term of $tilde(H)_(arrow.b arrow.t)$ is

$
bra(arrow.b) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.t) &=bra(arrow.b) 1/eta ap am - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z+ alpha_g^2/eta ket(arrow.t)\
&=(1/eta ap am+alpha_g^2/eta) +bra(arrow.b) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.t)
$

Focus on the second term

$
bra(arrow.b) - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z ket(arrow.t) \
=(sin(theta) bra(tilde(arrow.t)) + cos(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)tau_x + g^2/2 tau_z)(cos(theta) ket(tilde(arrow.t)) - sin(theta) ket(tilde(arrow.b)))\
=(sin(theta) bra(tilde(arrow.t)) + cos(theta) bra(tilde(arrow.b)))( - 1/(2 g sqrt(eta)) (ap + am)(cos(theta) ket(tilde(arrow.b)) - sin(theta) ket(tilde(arrow.t))) + g^2/2 (cos(theta) ket(tilde(arrow.t)) + sin(theta) ket(tilde(arrow.b)))\
=-1/(2 g sqrt(eta)) (ap + am) (cos (theta) cos(theta) - sin(theta) sin(theta)) + g^2/2 (cos(theta) cos(theta) + sin(theta) sin(theta))\
=-1/(2 g sqrt(eta)) (ap + am) cos(2 theta) + g^2/2 sin(2 theta)\
$

So the tern of $tilde(H)_(arrow.b arrow.t)$ is

$
bra(arrow.b) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.t) = 1/eta ap am+alpha_g^2/eta - 1/(2 g sqrt(eta)) (ap + am) cos(2 theta) + g^2/2 sin(2 theta)=bra(arrow.t) tilde(H)_(tilde(arrow.b)) (pm alpha_g) ket(arrow.b)
$

So the matrix representation of the effective Hamiltonian $tilde(H)=mat(tilde(H)_(arrow.b arrow.b), tilde(H)_(arrow.b arrow.t);tilde(H)_(arrow.t arrow.b), tilde(H)_(arrow.t arrow.t))$ is

$
tilde(H)_(tilde(arrow.b)) (pm alpha_g) &=1/eta ap am+alpha_g^2 \ &+ mat(-1/(2 g sqrt(eta)) (ap + am) sin(2 theta) - g^2/2 cos(2 theta),-1/(2 g sqrt(eta)) (ap + am) cos(2 theta) + g^2/2 sin(2 theta); -1/(2 g sqrt(eta)) (ap + am) cos(2 theta) + g^2/2 sin(2 theta),1/(2 g sqrt(eta)) (ap + am) sin(2 theta) + g^2/2 cos(2 theta))
$

whose ground state corresponds to

== with $eta -> infinity$

$
tilde(H)_(tilde(arrow.b)) (pm alpha_g) &=alpha_g^2 + mat(- g^2/2 cos(2 theta), g^2/2 sin(2 theta);  g^2/2 sin(2 theta), g^2/2 cos(2 theta))
$