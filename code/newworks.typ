#import "@preview/physica:0.9.3": *
#import "@preview/problemst:0.1.0": pset
#import "template.typ": project

#show: pset.with(
  class: "Rabi",
  student: "江源",
  title: "II",
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

= Generating functions

Suppose that we have a unipartite undirected graph—an acquaintance network, for example—of N vertices, with N large.

$
G_0(x) &= sum_(k=0)^N p_k x^k\
G_0(1) &= 1\
G_0^' (1) &= sum_(k=0)^N k p_k = angle.l k angle.r
$

= Poisson-distributed graphs

The simplest example of a graph of this type is one for which the distribution of degree is binomial, or Poisson in the large $N$ limit. This distribution yields the standard random graph studied by many mathematicians and discussed in Sec. I. In this graph the probability $p=z\/N$ of the existence of an edge between any two vertices is the same for all vertices, and $G_0(x)$ is given by

$
G_0(x) &= sum_(k=0)^N mat(N;k) p^k (1-p)^(N-k) x^k \
&= sum_(k=0)^N mat(N;k) (p x)^k (1-p)^(N-k)  \
&= (1-p + p x)^N\
&= lim_(N->infinity) (1 + (x-1) z/N)^N\
&= e^(z(x-1))
$

where the last equality applies in the limit $N -> infinity$.It is then trivial to show that the average degree of a vertex is indeed $G_0'(1) = z$  and that the probability distribution of degree is given by $p_k z^k e^(-z)\/k!$, which is the ordinary Poisson distribution. Notice also that for this special case we have $G_1(x)=G_0(x)$, so that the distribution of outgoing edges at a vertex is the same, regardless of whether we arrived there by choosing a vertex at random, or by following a randomly chosen edge. This property, which is peculiar to the Poissondistributed random graph, is the reason why the theory of random graphs of this type is especially simple.

= The mean component size, the phase transition, and the giant component

Although it is not usually possible to find a closed-form expression for the complete distribution of cluster sizes on a graph, we can find closed-form expressions for the average properties of clusters from Eqs. ~26! and ~27!. For example, the average size of the component to which a randomly chosen vertex belongs, for the case where there is no giant component in the graph, is given in the normal fashion by

$
H_1(x) = (H_0^' (x))/(H_0^' (1)) \
H_0(x) =x G_0(H_1(x))\
H_0^' (x) = G_0(H_1(x)) + x G_0^' (H_1(x)) H_1^' (x)\
angle.l s angle.r =H_0^' (1) =1 + G_0^' (1) H_1^' (1)
$

and hence

$
H_1^' (1) = (G_0^' (1))/(1 - G_0^' (1))
$

so

$
angle.l s angle.r =1 + (G_0^' (1))/(1 - G_0^' (1)) =1 + z_1^2/(z_1 - z_2)
$

= The giant component

$
G_1 (x) = (G_0^' (x))/ (G_0^' (1))=(sum_(k=1)^N k p_k x^(k-1))/(sum_(k=1)^N k p_k) =  (sum_(k=1)^N k p_k x^(k-1)) / (sum_(k=1)^N k p_k)\
G_1^' (x) = (sum_(k=2)^N k(k-1) p_k x^(k-2))/(sum_(k=1)^N k p_k)\
G_1^' (1) = (sum_(k=2)^N k(k-1) p_k)/(sum_(k=1)^N k p_k) 
$

#pagebreak()


// #bibliography("ref.bib")