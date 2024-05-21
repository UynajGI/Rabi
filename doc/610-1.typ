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

= 本征微观态定义

一个复杂系统具有 $N$ 个微观态，每个微观态包含 $mat(cos theta_i; sin theta_i )$ 个粒子，其中 $theta_i$ 表示 $i$ 微观态的相位，微观态历经 $M$ 的时间后，系统的系综矩阵 $S$ 可以写为

$
S_i (t) = cos theta_i (t)+ i sin theta_i (t) = e^lr(i theta_i (t))
$

在我们研究的动力学enso中，$theta$只取 $0$(升温)、 $pi/2$(不变) 和 $pi$(降温) 三个值，除以归一化因子 $C_0^2 = N M= sum_i sum_tau S_i^2 (tau)$ 后，系统的系综矩阵 $S$ 可以写为

$
S_i ' (t) = 1/sqrt(N M) (cos theta_i (t)+ i sin theta_i (t))
$

先不考虑归一化因子，时间关联矩阵 $C$ 可以写为
$
bold(C) &= bold(S)^H bold(S) \
C_(tau tau') &= sum_i S^*_i (tau) dot S_i (tau')\
&= sum_(i) (cos theta_i (tau)- i sin theta_i (tau))(cos theta_i (tau')+ i sin theta_i (tau')) \
& = sum_(i) (cos theta_i (tau) cos theta_i (tau') + sin theta_i (tau) sin theta_i (tau')- i (sin theta_i (tau) cos theta_i (tau') - cos theta_i (tau) sin theta_i (tau')))\
& = sum_(i) (cos (theta_i (tau) - theta_i (tau'))- i sin (theta_i (tau) - theta_i (tau')))\
& = sum_i e^lr(-i (theta_i (tau) - theta_i (tau'))) \
& = A_(tau tau') e^lr(-i Theta_(tau tau'))
$

空间间关联矩阵 $K$ 可以写为

$
bold(K) &= bold(S) bold(S)^H \
K_(i j) &= sum_tau S_i (tau) dot S^*_j (tau)\
&= sum_tau (cos theta_i (tau)+ i sin theta_i (tau))(cos theta_j (tau)- i sin theta_j (tau))\
&= sum_tau (cos theta_i (tau) cos theta_j (tau) + sin theta_i (tau) sin theta_j (tau)+ i (sin theta_i (tau) cos theta_j (tau) - cos theta_i (tau) sin theta_j (tau)))\
&= sum_tau (cos (theta_i (tau) - theta_j (tau)) + i sin (theta_i (tau) - theta_j (tau)))\
&= sum_tau e^lr(i (theta_i (tau) - theta_j (tau)))\
&= B_(i j) e^lr(i Psi_(i j))
$

