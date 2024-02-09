---
layout: default
title: Research
permalink: /research/
---

# Research Interests

Generally I'm interested in developing fast Monte Carlo methods. I've been recently working on a class of algorithms known as Piecewise Deterministic Markov Processes (PDMPs). These produce a Markov process instead of the standard Markov chain used in classical Markov Chain Monte Carlo (MCMC) and have a number of very interesting properties. They are able to:

1. Scale to big data challenges via sub-sampling the full data without sacrificing properties like asymptotic exactness.
2. They are non reversible, using gradient information to improve mixing properties.
3. They can sample problems where the gradient is undefined in some known regions of space. 
4. Can be constructed as continuous time limits of existing MCMC methods.

Below is an illustration of a simple PDMP known as the Zig-Zag process:

<img src="https://github.com/matt-sutton/ccpdmp/raw/main/animations/ZigZag.gif" alt="ZigZag Animation">

## In-Press

+ [Corenflos, A., Sutton, M., & Chopin, N. Debiasing Piecewise Deterministic Markov Process samplers using couplings. In arXiv [stat.CO].](http://arxiv.org/abs/2306.15422)

## Publications

+ [Sutton, M., Salomone, R., Chevallier, A., & Fearnhead, P. (2022). Continuously tempered PDMP samplers. Advances in Neural Information Processing Systems.](https://proceedings.neurips.cc/paper_files/paper/2022/hash/b5b939436789f76f08b9d0da5e81af7c-Abstract-Conference.html)

+ [Chevallier, A., Fearnhead, P., & Sutton, M. (2023). Reversible Jump PDMP Samplers for Variable Selection. Journal of the American Statistical Association, 118(544), 2915–2927.](https://doi.org/10.1080/01621459.2022.2099402)

+ [Sutton, M., & Fearnhead, P. (2023). Concave-Convex PDMP-based Sampling. Journal of Computational and Graphical Statistics: A Joint Publication of American Statistical Association, Institute of Mathematical Statistics, Interface Foundation of North America, 32(4), 1425–1435.](https://doi.org/10.1080/10618600.2023.2203735)

+ [Davies, L., Salomone, R., Sutton, M., & Drovandi, C. (2022). Transport Reversible Jump Proposals. International Conference on Artificial Intelligence and Statistics, vol. 206, pp. 6839–6852](https://proceedings.mlr.press/v206/davies23a.html )

+ [Sutton, M., Sugier, P.-E., Truong, T., & Liquet, B. (2022). Leveraging pleiotropic association using sparse group variable selection in genomics data. BMC Medical Research Methodology, 22(1), 9.](https://doi.org/10.1186/s12874-021-01491-8)

+ [de Micheaux, P. L., Liquet, B., & Sutton, M. (2019). PLS for Big Data: A unified parallel algorithm for regularised group PLS. Statistics Surveys, 13(none), 119–149.](https://doi.org/10.1214/19-SS125)

+ [Sutton, M., Thiébaut, R., & Liquet, B. (2018). Sparse partial least squares with group and subgroup structure. Statistics in Medicine, 37(23), 3338–3356.](https://doi.org/10.1002/sim.7821)

+ [Liquet, B., Mengersen, K., Pettitt, A. N., & Sutton, M. (2017). Bayesian Variable Selection Regression of Multivariate Responses for Group Data. Bayesian Analysis , 12(4), 1039–1067.](https://doi.org/10.1214/17-BA1081)

+ [Billington, Elizabeth J., Khodkar, Abdollah, Petrusma, Dylan and **Sutton, Matthew** (2014) Lambda-fold theta graphs: Metamorphosis into 6-cycles. AKCE International Journal of Graphs and Combinatorics, 11 1: 81-94.](http://espace.library.uq.edu.au/view/UQ:333454) [**UQ student access only**]

