令$U=\exp (\lambda \sigma_z (a-a^\dagger))$

对每一个算子求$UAU^\dagger$

## $a$

对$a$求

$$
\begin{aligned}
    UaU^\dagger&=\sum_n \frac{C_n}{n!}\\
    C_0&=a\\
    C_1&=\left[\lambda \sigma_z (a-a^\dagger),a\right]=-\lambda \sigma_z[a^\dagger,a]=\lambda \sigma_z\\
    C_n &= 0 \left(n\ge 2\right)
\end{aligned}
$$

## $a^\dagger$

对$a^\dagger$求

$$
\begin{aligned}
    Ua^\dagger U^\dagger&=\sum_n \frac{C_n}{n!}\\
    C_0&=a^\dagger\\
    C_1&=\left[\lambda \sigma_z (a-a^\dagger),a^\dagger \right]=\lambda \sigma_z[a,a^\dagger]=\lambda \sigma_z\\
    C_n &= 0 \left(n\ge 2\right)
\end{aligned}
$$

## $a^\dagger a$

$$
\begin{aligned}
    Ua^\dagger a U^\dagger&=Ua^\dagger U^\dagger Ua U^\dagger\\
    &=\left(a^\dagger+\lambda \sigma_z\right)\left(a+\lambda \sigma_z\right)\\
    &=a^\dagger a+\lambda \sigma_z(a+a^\dagger)+\lambda^2
\end{aligned}
$$

## 对$\sigma_x$

$$
\begin{aligned}
    U\sigma_x U^\dagger&=\sum_n\frac{C_n}{n!}\\
    C_0&=\sigma_y\\
    C_1&=\left[\lambda \sigma_z (a-a^\dagger),\sigma_x\right]=2\mathrm{i}\lambda(a-a^\dagger)\sigma_y
\end{aligned}
$$

## 对$\sigma_y$

$$
\begin{aligned}
U\sigma_y U^\dagger&=\sum_n\frac{C_n}{n!}\\
C_0&=\sigma_y\\
C_1&=\left[\lambda \sigma_z (a-a^\dagger),\sigma_y\right]=-2\mathrm{i}\lambda(a-a^\dagger)\sigma_x
\end{aligned}
$$

## 总结可得，对于$\sigma_x$

$$
C_n = \left\{\sigma_x,2\mathrm{i}\lambda(a-a^\dagger)\sigma_y,2^2\lambda^2(a-a^\dagger)^2\sigma_x,2^3\mathrm{i}\lambda^3(a-a^\dagger)^3\sigma_y,\cdots\right\}
$$

即

$$
\begin{aligned}
U\sigma_x U^\dagger&=\sum_n\frac{C_n}{n!}\\&=\sum_{i=0}{\left[\frac{(2\lambda (a-a^\dagger))^{2i}}{2i!}\sigma_x+\mathrm{i}\frac{(2\lambda(a-a^\dagger))^{(2i+1)}}{(2i+1)!}\sigma_y\right]}\\&=\sigma_x\sinh\left(2\lambda(a-a^\dagger)\right)+\mathrm{i}\sigma_y\cosh\left(2\lambda(a-a^\dagger)\right)
\end{aligned}
$$

## 对$\sigma_z$

显然为 0

## 对$H$

$$
H=\omega a^\dagger a + \frac{\Omega}{2}\sigma_x + \lambda \sigma_z (a+a^\dagger)
$$

分开求解

$$
H_1 = \omega a^\dagger a\\
H_2 = \frac{\Omega}{2}\sigma_x\\
H_3 = \lambda \sigma_z (a+a^\dagger)
$$

## 对$H_1$

$$
UH_1 U^\dagger=\omega (a^\dagger a+\lambda \sigma_z(a+a^\dagger)+\lambda^2)
$$

## 对$H_2$

$$
\begin{aligned}
UH_2 U^\dagger&=\frac{\Omega}{2}\left[\sigma_x\sinh\left(2\lambda(a-a^\dagger)\right)+\mathrm{i}\sigma_y\cosh\left(2\lambda(a-a^\dagger)\right)\right]
\end{aligned}
$$

## 对于$H_3$

$$
\begin{aligned}
UH_3 U^\dagger&=\lambda\sigma_zU(a+a^\dagger)U^\dagger\\
&=\lambda\sigma_z\left(a+a^\dagger+2\lambda\sigma_z\right)
\end{aligned}
$$

## 合并得到

$$
\begin{aligned}
UH U^\dagger&=\omega (a^\dagger a+\lambda \sigma_z(a+a^\dagger)+\lambda^2)+\frac{\Omega}{2}\left[\sigma_x\sinh\left(2\lambda(a-a^\dagger)\right)+\mathrm{i}\sigma_y\cosh\left(2\lambda(a-a^\dagger)\right)\right]+\lambda\sigma_z\left(a+a^\dagger+2\lambda\sigma_z\right)\\
&=\omega a^\dagger a+(\omega\lambda^2+2\lambda^2)+(\omega\lambda+\lambda)\sigma_z(a-a^\dagger)+\frac{\Omega}{2}\left[\sigma_x\sinh\left(2\lambda(a-a^\dagger)\right)+\mathrm{i}\sigma_y\cosh\left(2\lambda(a-a^\dagger)\right)\right]
\end{aligned}
$$
