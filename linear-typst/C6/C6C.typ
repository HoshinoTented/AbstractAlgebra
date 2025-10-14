#import "../prelude.typ": *
#show: template(6)

#definition(number: "6.46", [ orthogonal complement ])[
  Let $U$ a subset of $V$, then the orthogonal complement of $U$ is denoted by
  $U^perp$, a set of all vector in $V$ that orthogonal to $U$:
  $
    U^perp = { v in V | forall u in U, ip(u, v) = 0}
  $
]

#theorem(number: "6.47", [ Properties of orthogonal complement ])[
  #set enum(numbering: "a)")
  + If $U$ a subset of $V$, then $U^perp$ is a subspace of $V$
  + ${0}^perp = V$
  + $V^perp = {0}$
  + If $U$ a subset of $V$, then $U inter U^perp subset.eq {0}$
  + If $G, H$ are subset of $V$ and $G subset.eq H$, then $H^perp subset.eq G^perp$
] 
#proof[
  + $0 in U^perp$ cause $0$ is orthogonal to any vector. \
    For any $v, w in U^perp$ and $u in U$, $ip(u, v + w) = ip(u, v) + ip(u, w) = 0$. \
    For any $lambda in F$, $w in U^perp$ and $u in U$, $ip(u, lambda w) = overline(lambda) ip(u, w) = 0$.
  + Trivial
  + For any non-zero $v in V^perp$, we have $ip(v, v) = 0$, thus $v = 0$.
  + For any $u in U inter U^perp$, we have $ip(u, u) = 0$, thus $u = 0$.
  + For any $v in H^perp$, then for any $g in G$, we have $ip(v, g) = 0$ since $g in G subset.eq H$. Thus $H^perp subset.eq G^perp$.
]

#theorem(number: "6.49")[
  Let $U$ a finite subspace of $V$, then
  $
    V = U plus.circle U^perp
  $
] <oc-decomp>
#proof[
  We will show $V = U + U^perp$ and $U inter U^perp = {0}$.
  - For any $v in V$, since $U$ is a finite subspace of $V$, let $join(v, m - 1)$ a basis of $U$,
  then applying Gram-Schmidt Procedure on $join(v, m - 1), v$, we have $join(e, m - 1), e$, where $e$ is a linear combination of $join(v, m - 1)$ and $v$.
  Then we know $join(e, m - 1) in U$, and $e$ is orthogonal to all $join(e, m - 1)$,
  thus $e in U^perp$.
  Since $e$ is a linear combination of $join(v, m - 1), v$, then we can write
  $v$ as a linear combination of $join(v, m - 1), e$ where $join(v, m - 1) in U$
  and $e in U^perp$, thus $V = U + U^perp$.
  - We know $U inter U^perp subset.eq {0}$ and both $U$ and $U^perp$ are subspace of $V$, then $0 in U$ and $0 in U^perp$, thus $U inter U^perp = {0}$.

  For part 1, let
  $u = lc(#{(i) => $ip(v, e_ #i) e_ #i$}, m - 1)$
  and
  $w = v - join(separator: -, #{(i) => $ip(v, e_ #i) e_ #i$}, m - 1)$,
  then we can write $v = u + w$, it is easy to show $w$ is orthogonal to $e_k$.
]

#theorem(number: "6.52")[Double Orthogonal Complement Elimination][
  Let $U$ a finite subspace of $V$, then:
  $
    U = (U^perp)^perp
  $
] <double-oc-elim>
#proof[
  - For any $u in U$, we will show that $u in (U^perp)^perp$, that is, $u$ is orthogonal to $U^perp$. For any $v in U^perp$, we know $ip(u, v) = 0$ since $v in U^perp$, thus $u$ is orthogonal to $U^perp$, therefore $u in (U^perp)^perp$ and $U subset.eq (U^perp)^perp$.
  - For any $u in (U^perp)^perp$, we know $u$ is orthogonal to $U^perp$, that means for any $v in U^perp$, $ip(v, u) = 0$. Then by $V = U plus.circle U^perp$. We know $u in U$, since we can write $u = a e + b f$ where $e in U$ and $f in U^perp$, and we know $b f = 0$ since $ip(v, u) = ip(v, a e + b f) = ip(v, a e) + ip(v,  b f) = b ip(v, f) = 0$. Thus $u = a e in U$.
  Another clever proof of the second part is: Let $v in (U^perp)^perp$,
  then $v = u + w$ where $u in U$ and $w in U^perp$, then $v - u = w in U^perp$.
  We know $v in (U^perp)^perp$ and $u in U subset.eq (U^perp)^perp$, thus $v - u in (U^perp)^perp inter U^perp$, then $v - u in {0}$ (use $U^perp$ as the subspace of $V$ instead of $U$), thus $v = u in U$.
]

#theorem(number: "6.54")[
  Let $U$ a finite subspace of $V$, then
  $
    U^perp = {0} iff U = V
  $
]
#proof[
  $
    U^perp &= {0} \
    (U^perp)^perp &= {0}^perp quad #[by ] -^perp \
    U &= {0}^perp quad #[by @double-oc-elim] \
    U &= V quad #[by property of orthogonal complement]
  $
]

#definition(number: "6.55")[
  Let $U$ a finite subspace of $V$, an orthogonal projection $P_U in lt(V)$ that maps $V$ to $U$ is defined by:
  $
    P_U(v) = u \
    text("where") \
    v = u + w, u in U, w in U^perp
  $
]

#theorem(number: "6.57")[Properties of Orthogonal Projection][
  #set enum(numbering: "a)")
  Let $U$ a finite subspace of $V$, then
  + $P_U in lt(V)$
  + For any $u in U$, $P_U u = u$
  + For any $w in U^perp$, $P_U w = 0$
  + $rangev P_U = U$
  + $nullv P_U = U^perp$
  + For any $v in V$, $v - P_U v in U^perp$
  + $P_U^2 = P_U$
  + For all $v in V$, $norm(P_U v) <= norm(v)$
  + Let $join(e, m - 1)$ a orthonormal basis of $U$ and $v in V$, then:
    $
      P_U v = join(#{(i) => $ip(v, e_ #i) e_ #i$}, m - 1)
    $
] <Properties-of-Orthogonal-Projection>
#proof[
  - Additivity by the unique representation, Homogeneity is trivial.
  - For any $u in U$, $u = v + w$ where $v in U$ and $w in U^perp$,
    then $w = 0$ (cause $0 = ip(u, w) = ip(v + w, w) = ip(v, w) + ip(w, w) = 0 + ip(w, w)$), therefore $u = v = P_U u$
  - For any $w in U^perp$, $w = u + v$ where $u in U$ and $v in U^perp$, then $u = 0$ since $0 = ip(w, u) = ip(u + v, u) = ip(u, u) + ip(v, u) = ip(u, u) + 0 = ip(u, u)$
  - By definition $P_U U subset.eq U$, then by b) we know $U subset.eq P_U U$, thus $rangev P_U = U$.
  - By c) we know $U^perp subset.eq nullv P_U$, and for any $v in V$ such that $P_U v = 0$, that means $v = u + w$ where $u = 0 in U$ and $w in U^perp$, thus $v = w in U^perp$ and therefore $nullv U subset.eq U^perp$.
  - Trivial, by definition of $P_U$.
  - Trivial, by b).
  - Trivial, by definition of $P_U$.
  - We can write $v$ in form of $v = underbrace(lc(#{(i) => $ip(v, e_ #i) e_ #i$}, m - 1), u) + underbrace(v - join(separator: -, #{(i) => $ip(v, e_ #i) e_ #i$}, m - 1), w)$, it is easy to show that $u in U$ and $w in U^perp$.
]

#theorem(number: "6.61")[Shortest Distance To Subspace][
  Let $U$ a finite subspace of $V$, $v in V$ and $u in U$. Then
  $
    norm(v - P_U v) <= norm(v - u)
  $

  The inequality is equal if and only $u = P_U v$.
] <Shortest-Distance-To-Subspace>
#proof[
  This *clever* proof comes from the textbook.
  $
    norm(v - P_U v)^2 & <= norm(v - P_U v)^2 + norm(P_U v - u)^2 \
    & = norm(v - P_U v + P_U v - u)^2 \
    & = norm(v - u)^2
  $

  The second line is by $v - P_U v in U^perp$ is orthogonal to $P_U v - u in U$.
  And the inequality is equal if and only if $norm(P_U v - u) = 0$, which is equivalent to $u = P_U v$.
]

#theorem(number: "6.67")[Strict on $(nullv T)^perp$ is bijective][
  Let $V$ finite and $T in lt(V, W)$. Then $T|_((nullv T)^perp) : (nullv T)^perp arrow rangev T$ is bijective.
] <Strict-on-nTp-is-bijective>
#proof[
  Recall that $dim (nullv T)^perp = dim V - dim nullv T = dim rangev T$.
  Let $v in (nullv T)^perp$ such that $T|_((nullv T)^perp) v = 0$,
  then $T v = 0$, thus $v in nullv T$, therefore $v in nullv T inter (nullv T)^perp$,
  hence $v = 0$. Then $nullv (T|_((nullv T)^perp)) = {0}$, therefore $T|_((nullv T)^perp)$ is injective.

  Surjective is trivial by $V$ is finite and $T|_((nullv T)^perp)$ is injective.
]

#definition(number: "6.68")[Pseudoinverse][
  Let $V$ finite, $T in lt(V, W)$. The pseudoinverse of $T$ is defined by:
  $
    T^dagger w = (T|_((nullv T)^perp))^(-1) P_(rangev T) w
  $

  Informally, $T (T^dagger w)$ is the nearest element to $w$ (by @Shortest-Distance-To-Subspace)
]

#theorem(number: "6.69")[Properties of Pseudoinverse][
  #set enum(numbering: "a)")
  Let $V$ finite and $T in lt(V, W)$.
  + If $T$ is invertible, then $T^pinv = T^inv$
  + $T T^pinv = P_(rangev T) =$ orthogonal projection from $W$ to $rangev T$
  + $T^pinv T = P_((nullv T)^perp) =$ orthogonal projection from $V$ to $(nullv T)^perp$.
]
#proof[
  + If $T$ is invertible, then $T$ is surjective, thus $P_(rangev T) w = w$ and $T|_((nullv T)^perp) = T$ since $nullv T = {0}$ implies $(nullv T)^perp = V$. Then $T^pinv = T^inv compose I$.
  + Trivial
  + By unfolding, we get $T^pinv T = (T|_((nullv T)^perp))^inv compose T$.
    We want to show that $T(P_((nullv T)^perp) v) = T v$, then we know
    $(T|_((nullv T)^perp))^inv (T v) = P_((nullv T)^perp) v$.
    We can see
    $
      T(P_((nullv T)^perp) v) &= T(v - (v - P_((nullv T)^perp) v)) \
      &= T v - T(v - P_((nullv T)^perp) v) \
      &= T v
    $
    the second equation is by @Properties-of-Orthogonal-Projection (f).
]

#theorem(number: "6.70")[Pseudoinverse is the best solution][
  #set enum(numbering: "a)")
  Let $V$ finite, $T in lt(V, W)$, $w in W$.
  + Let $v in V$, then
    $ norm(T(T^pinv w) - w) <= norm(T v - w) $
    the inequality is equal if and only if $v in T^pinv w + nullv T$.
  + Let $v in T^pinv w + nullv T$, then
    $ norm(T^pinv w) <= norm(v) $
    the inequality if equal if and only if $v = T^pinv w$.

  Note that $T^pinv w + nullv T$ is a translate, not the sum of two subspaces.
]
#proof[
  + $
      norm(T(T^pinv w) - v) &= norm(P_(rangev T) w - w) \
      &= norm(w - P_(rangev T) w) \
      &<= norm(w - T v) quad #{[by @Shortest-Distance-To-Subspace]} \
      &= norm(T v - w)
    $
    and the inequality equal if and only if $T v = P_(rangev T)w$.
    By $w' = (T|_((nullv T)^perp))^inv P_(rangev T) w = T^pinv w$ we know $v = w' + u$
    where $w' in (nullv T)^perp$ and $u in nullv T$. It is easy to show that
    $w'$ is unique such that $v = w' + u$ by @Strict-on-nTp-is-bijective.
    Thus $v in T^pinv + nullv T$ if and only if $T v = P_(rangev T) w$
  + Let $u in nullv T$ such that $v = T^pinv w + u$
    $
      norm(v)^2 = norm(T^pinv w + u)^2 = norm(T^pinv w)^2 + norm(u)^2
    $
    thus $norm(T^pinv w) <= norm(v)$, equal if and only if $u = 0$,
    which is equivalent to $v = T^pinv w$.
]