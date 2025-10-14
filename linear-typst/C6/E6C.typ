#import "../prelude.typ": *
#show: template(6)

#exercise[
  Let $join(v, m - 1)$. Show that ${join(v, m - 1)}^perp = spanv(join(v, m - 1))^perp$.
]
#proof[
  - Since ${join(v, m - 1)} subset.eq spanv(join(v, m - 1))$, thus $spanv(join(v, m - 1))^perp subset.eq {join(v, m - 1)}^perp$.
  - For any $u in {join(v, m - 1)}^perp$ and $v in spanv(join(v, m - 1))$,
    we know $v = joinp(c, v, m - 1)$, then $ip(v, u) = join(#{(i) => $ip(c_#i v_#i, u)$}, m - 1) = 0$, thus $u in spanv(join(v, m - 1))^perp$
]

#exercise[
  Let $U$ a subspace of $V$, $join(u, m - 1)$ a basis of $U$,
  and $join(u, m - 1), join(v, start: m, m + n - 1)$ a basis of $V$.
  Show that applying Gram-Schmidt Procedure to such basis of $V$, the result
  $join(e, m - 1), join(f, start: m, m + n - 1)$.
  Then $join(e, m - 1)$ is an orthonormal basis of $U$ and $join(f, start: m, m + n - 1)$ is an orthonormal basis of $U^perp$.
]
#proof[
  Since $spanv(join(e, m - 1)) = spanv(join(u, m - 1))$, then $join(e, m - 1)$ is an orthonormal basis of $U$. For each $f_k$ and $u in U$,
  $ip(f_k, u) = ip(f_k, od(u, e, m - 1)) = 0$, since $f_k$ is orthogonal to all $e_i$.
  Thus $f_k in U^perp$, therefore $join(f, start: m, m + n - 1)$ is a orthonormal
  basis of $U^perp$ (recall that $dim V = dim U + dim U^perp$).
]

#exercise[
  Let $U$ a subspace of $nR^4$, defined by
  $
    U = spanv((1, 2, 3, - 4), (-5, 4, 3, 2)).
  $
  Find a orthonormal basis of $U$ and a orthonormal basis of $U^perp$.
]
#proof[
  too complicated. sorry
]

#exercise[
  Let $join(e, n - 1)$ a vector list in $V$, such that $norm(e_k) = 1$ for all $k$ and
  $
    norm(v)^2 = lc(#{(i) => $|ip(v, e_#i)|^2$}, n - 1)
  $
  for all $v in V$, show that $join(e, n - 1)$ is an orthonormal basis of $V$.
]
#proof[
  Let $U = spanv(join(e, n - 1))$ and $v in U^perp$.
  Then $norm(v)^2 = lc(#{(i) => $|ip(v, e_#i)|^2$}, n - 1)$
  where $ip(v, e_k) = 0$, thus $norm(v) = 0$, therefore $v = 0$.
  That means $U^perp = {0}$, which means $V = U plus.circle {0} = U$.
  We still need to show that $join(e, n - 1)$ is linear independent.
  For any $e_k$, we have
  $1 = norm(e_k)^2 = lc(#{(i) => $|ip(e_k, e_#i)|^2$}, n - 1) >= |ip(e_k, e_k)|^2 = 1^2$,
  thus $ip(e_k, e_i) = 0$ for all $j$ that $k eq.not j$.
  Therefore $join(e, n - 1)$ is linear independent since any vector is orthogonal to each others. Hence $join(e, n - 1)$ is an orthonormal basis of $U$, thus an orthonormal basis of $V$.
]

#let nTp = $(nullv T)^perp$

#exercise[Let $V$ finite and $U$ a subspace of $V$. Show that $P_(U^perp) = I - P_U$.] <Vector-Decompose-by-Projection>
#proof[
  For any $v in V$, we can write $v = u + u^perp$ where $u in U$ and $u^perp in U^perp$, note that the decomposition is unique, thus $P_U v = u$ and $P_(U^perp) = u^perp$, and $v = P_U v + P_(U^perp) v$. Therefore $I = P_U + P_(U^perp)$.
]

#exercise[Let $V$ finite and $T in lt(V, W)$. Show that $T = T P_((nullv T)^perp) = P_(rangev T) T$] <Orthogonal-Projection-Compose-T>
#proof[
  - We have $T P_nTp v = T|_nTp P_nTp v$, then $(T|_nTp)^inv T v = (T|_nTp)^inv P_(rangev T) T v = T^pinv T v = P_nTp$, thus $T v = T|_nTp P_nTp v = T P_nTp v$.
  - $T = P_(rangev T) T$ is trivial, since $T v in rangev T$, thus $P_(rangev T) (T v) = T v$.

  Note that we can assume $P_(rangev T)$ exists cause $rangev T$ is finite, and $rangev T$ is finite is by $V$ is finite.
]

#exercise[Let $X$ and $Y$ are finite subspaces of $V$. Show that $P_X P_Y = 0 iff ip(x, y) = 0 forall x in X, y in Y$]
#proof[
  - ($arrow.double$) For any $y in Y$, we have $P_X P_Y y = P_X y = 0$, thus $y = 0$ or $y in X^perp$, both case lead us to $ip(x, y) = 0$ for all $x in X$.
  - ($arrow.l.double$) For any $v in V$, $P_X (P_Y v) = 0$ since $P_Y v in Y$, we have $P_Y v in X^perp$ since for any $x in X$, we have $ip(x, P_Y v) = 0$. Therefore $P_X (P_Y v) = 0$, thus $P_X P_Y = 0$.
]

#exercise[
  Let $U$ a finite subspace of $V$ and $v in V$. Define $phi : U -> F$ by:
  $
    phi(u) = ip(u, v)
  $
  for all $u in U$. Apply Riesz Representation Theorem on $U$, we get unique $w in U$ such that:
  $
    phi(u) = ip(u, w)
  $
  for all $u in U$. Show that $w = P_U v$.
]
#proof[
  We can write $v = P_U v + P_(U^perp) v$ (by @Vector-Decompose-by-Projection),
  then $phi(u) = ip(u, v) = ip(u, P_U v + P_(U^perp) v) = ip(u, P_U v) + ip(u, P_(U^perp) v) = ip(u, P_U v)$ since $u in U$ but $P_(U^perp) v in U^perp$.
  Then $w = P_U v$ since $w$ is unique.
]

#exercise[
  Let $V$ finite. Suppose $T in lt(V)$ such that $T^2 = T$ and for all $v in nullv T$ and $w in rangev T$, we have $v perp w$. Show that there is a subspace $U$ such that $T = P_U$.
]
#proof[
  By $dim V = dim nullv T + dim rangev T$ and $nullv T perp rangev T$, we have $V = nullv T plus.circle rangev T$. Then for any $v in V$, we can write $v = u + w$ where $u in nullv T$ and $w in rangev T$, thus $T v = T (u + w) = T u + T w = T w = P_(rangev T) v$. Therefore $T = P_(rangev T)$.

  // Bug: we should show $(rangev T)^perp = nullv T$.
  Let $v = u + w$ where $u in rangev T$ and $w in nullv T$ (since $V = rangev T plus.circle nullv T$), and $v = u' + w'$ where $u' in rangev T$ and $w in (rangev T)^perp$ (since $V = rangev T plus.circle (rangev T)^perp$).
  If $v = 0$ then $u = u' = w = w' = 0$, we may suppose $v eq.not 0$.
  Then $v - v = u + w - u' - w' = (u - u') + (w - w') = 0$, and $ip(0, v) = ip(u - u' + w - w', v) = ip(u - u', v) + ip(w - w', v) = ip(u - u', v) = 0$, which means $u - u' = 0$ since $u - u' in rangev T$. Therefore $w = v - u = v - u' = w'$, and $nullv T = (rangev T)^perp$.
]

#exercise[
  Let $V$ finite, $T in lt(V)$ such that $T^2 = T$ and $norm(T v) <= norm(v)$ for all $v in V$. Show that there is a subspace $U$ such that $T = P_U$.
]
#proof[
  // Clues:
  // + $T$ is $#math.op([id])$ on $rangev T$ (by $T^2 = T$)
  // + $norm(T v) = norm(v)$ for all $v in rangev T$ (by 1)
  // + Showing $norm(v - P_(rangev T) v) = norm(v - T v)$ can solve.
  // + Showing $T v = 0$ for all $v in (rangev T)^perp$ can solve.
  // + Showing $(T|_nTp)^inv T = T^pinv$ can solve.
  // + $T|_nTp$ is injective, can we get something useful by $T$ is id on $rangev T$? such as showing $nTp = rangev T$.
  // + #strike[For any $w in (rangev T)^perp$, let $v = T w + w$, then $norm(T v) = norm(v)$].
  // + #strike([ The last clue disprove $T w = 0$ when $w eq.not 0$ ]). My bad, $T^2 eq.not I$!
  // + For any $w in V$, let $v = w - T w$, then $T v = T w - T w = 0$. 
  // + $nullv T inter rangev T = {0}$, thus $V = nullv T plus.circle rangev T$, by $T^2 = T$.
  // + $T P_(rangev T) = P_(rangev T)$ and $P_(rangev T) T = T$
  // + $T (P_(rangev T) v - v) = P_(rangev T) (v - T v)$ by last clue, we want the equal is $0 = 0$.
  // + Thus $P_(rangev T) v - v in nullv T iff v - T v in (rangev T)^perp$
  // + #grid(columns: 3, gutter: 5pt, align: center,
  //     $norm(P_(rangev T) (v - T v))$, $=$, $norm(T (P_(rangev T) v - v))$,
  //     rotate(90deg, $<=$), [], rotate(90deg, $<=$),
  //     $norm(v - T v)$, $>=$, $norm(P_(rangev T) v - v)$
  //   )
  //   the bottom inequality is by $norm(v - P_U v) <= norm(v - u)$, maybe useless.
  // + $P_(rangev T) v - T v + (v - P_(rangev T) v ) = v - T v$
  // + $P_(rangev T) v - T v + (T v - v) = P_(rangev T) v - v$
  // + For any $v in rangev T$ and $w in (nullv T)^perp$ such that $T w = v$, then $ip(v, w) = ip(w, w)$ by using $(T_nTp)^inv$ is bijective.
  I give up, I search on stackoverflow, and it seems need some limit knowledge.
  // Basically let $u in rangev T$ and $w in nullv T$, then 
  // $
  //   norm(T(u + w)) &<= norm(u + w) \
  //   norm(T u + T w) &<= norm(u + w) \
  //   norm(T u) &<= norm(u + w) \
  //   norm(u)^2 &<= norm(u + w)^2 \
  //   norm(u)^2 &<= norm(u)^2 + norm(w)^2 + 2 real ip(u, w) \
  //   0 &<= norm(w)^2 + 2 real ip(u, w) \
  // $
  // By letting $w = alpha w'$ where $w' in nullv T$, we have $alpha^2 norm(w') + 2 real ip(u, w) >= 0$, then by some limit magic, we have $2 real ip(u, w) >= 0$
]

#exercise[
  Let $T in lt(V)$ and $U$ a finite subspace of $V$. Show that:
  $
    U "is invariant under" T iff P_U T P_U = T P_U
  $
] <Exercise-11>
#proof[
  - $(arrow.double)$ For any $v in V$:
    $
      P_U T P_U v &= P_U (P_U v) quad "by" U "is invariant under T" \
      &= P_U v quad "by" P_U "is identity on" U \
      &= T P_U v quad "by" U "is invariant under T" \
    $
  - $(arrow.l.double)$ For any $u in U$: 
    $
      P_U T P_U u &= T P_U u \
      P_U T u &= T u quad "by" P_U "is identity on" U \
    $
    we can write $T u = v + w$ where $v in U$ and $w in U^perp$.
    Thus $P_U T u = v$ and $T u = v + w$, that means $w = 0$ thus $T u = u in U$.
]


#exercise[
  Let $V$ is finite and $T in lt(V)$, and $U$ is a subspace of $V$. Show that:
  $
    U "and" U^perp "are invariant under" T iff P_U T = T P_U
  $
]
#proof[
  - By $U$ is invariant under $T$, we have $P_U T P_U = T P_U$ by @Exercise-11. Then
    $
      P_U T P_U &= T P_U \
      P_U T (I - P_(U^perp)) &= T P_U quad "by" #[@Vector-Decompose-by-Projection] \
      P_U T I - P_U T P_(U^perp) &= T P_U \
    $
    We will show that $P_U T P_(U^perp) = 0$, for any $v in V$, we have $P_(U^perp) v in U^perp$, since $U^perp$ is invariant under $T$, thus $P_U T P_(U^perp) v = P_U P_(U^perp) v$, also, since $P_U w = 0$ for all $w in U^perp$, thus $P_U P_(U^perp) v = 0$, therefore $P_U T P_(U^perp) = 0$.
  - For any $u in U$, $P_U T u = T P_U u = T u$, thus $T u in U$. Similarly, for any $u in U^perp$, $P_U T u = T P_U u = T 0 = 0$, thus $T u in U^perp$ since $P_U T u = 0$.
]

#exercise[
  #set enum(numbering: "a)")
  Let $F = nR$ and $V$ finite. For any $v in V$, define $phi_v$ a linear functorial on $V$ by:
  $
    phi_v (u) = ip(u, v)
  $
  for all $u in V$.
  + Show that $v |-> phi_v : V -> V'$ is injective.
  + Show that $v |-> phi_v$ is isomorphism by using dimension.

  Note that you should not use Riesz Representation Theorem here.
]
#proof[
  + For any $phi_v = phi_w$ where $v, w in V$. We have 
    $
      ip(v - w, v - w) = ip(v, v) + ip(w, w) - 2 ip(v, w)
    $
    Note that it is $2 ip(v, w)$ instead of $2 real ip(v, w)$ cause $F = nR$. Then by $phi_v = phi_w$ we have $ip(v, v) = phi_v (v) = phi_w (v) = ip(v, w)$, similarly, $ip(w, w) = ip(w, v) = ip(v, w)$, thus $ip(v - w, v - w) = 0$, which means $v - w = 0$, hence $v = w$.
  + $v |-> phi_v$ is surjective since $dim V = dim V'$ and injective, thus isomorphism.
]

#exercise[
  Let $join(e, n - 1)$ an orthonormal basis of $V$. Show that the dual basis of $join(e, n - 1)$ is $join(#{(i) => $phi_(e_ #i)$}, n - 1)$, where $phi_(e_k)$ is given by Riesz Representation Theorem.
]
#proof[
  For any $k = 0, dots.c, n - 1$, let $psi_(e_k)$ the dual basis of $e_k$. We will show that $psi_(e_k) = phi_(e_k)$. By Riesz Representation Theorem, we know $psi_(e_k) = phi_(f_k) = ip(dot, f_k)$ for some $f_k in V$. By definition of $psi_(e_k)$, we know $ip(e_i, f_k) = 0$ for all $i eq.not k$, thus $f_k$ is a scalar multiple of $e_k$ (Let $U = spanv(dots.c, e_(k - 1), e_(k + 1), dots.c)$, then $f_k in U^perp$ where $U^perp = spanv(e_k)$). Then by $psi_(e_k) (e_k) = ip(e_k, f_k) = 1$ we know $e_k = 1 dot f_k$, thus $e_k = f_k$.
]

#exercise[
  In $nR^4$, let $U = spanv((1, 1, 0, 0), (1, 1, 1, 2))$. Find $u$ such that $norm(u - (1, 2, 3, 4))$ is minimum.
]
#proof[
  Too complicated, sorry.
]

#thmcounter("exercise", value: (18,))

#exercise[
  Let $V$ finite, and $P in lt(V)$ is an orthogonal projection from $V$ to some subspace. Show that $P^pinv = P$.
]
#proof[
  #let nPp = $(nullv P)^perp$
  Let $U$ a subspace of $V$ and $P = P_U$. Then $P^pinv = (P|_nPp)^inv P$,
  where $nPp = (nullv P_U)^perp = (U^perp)^perp = U$, and recall that $P$ acts like identity on $U$, thus $P_U = (P_U)^inv = I$. Then $P^pinv = I P = P$.
]

#exercise[
  Let $V$ finite and $P in lt(V, W)$. Show that:
  $
    nullv T^pinv = (rangev T)^perp quad "and" quad rangev T^pinv = (nullv T)^perp
  $
]
#proof[
  - $nullv T^pinv = nullv (P_(rangev T)) = (rangev T)^perp$. The first equation is by bijective function ($(T|_nTp)^inv$) doesn't effect null space.
  - $rangev T^pinv = rangev (T|_nTp)^inv = (nullv T)^perp$. The first equation is by surjective function ($P_(rangev T)$) doesn't effect range.
]

#exercise[TODO]

#exercise[
  Let $V$ finite and $T in lt(V, W)$. Show that:
  $
    T T^pinv T = T quad "and" quad T^pinv T T^pinv = T^pinv
  $

  These equations are obviously true when $T$ is invertible, in that case, $T^pinv = T^inv$.
]
#proof[
  Recall that $T = P_(rangev T) T = T P_nTp$ (by @Orthogonal-Projection-Compose-T) and $T T^pinv = P_(rangev T)$ and $T^pinv T = P_nTp$. Then:
  - $T T^pinv T = P_(rangev T) T = T$
  - $T^pinv T T^pinv = P_nTp T^pinv = T^pinv$ (Recall that $rangev T^pinv = nTp$, thus the equation is also $P_(rangev T^pinv) T^pinv = T^pinv$)
  
  For second case, we can still use $P_(rangev T^pinv) T^pinv = T^pinv$ even $T^pinv : W -> V$ where $W$ can be infinite, cause it requires that $rangev T^pinv$ is finite, where $rangev T^pinv$ is a subspace of $V$ and $V$ is finite.
]

#exercise[
  Let $V$ and $W$ are finite and $T in lt(V, W)$. Show that:
  $
    (T^pinv)^pinv = T
  $
]
#proof[
  For any $v in V$:
  $
    (T^pinv)^pinv &= (T^pinv|_((nullv T^pinv)^perp))^inv P_(rangev T^pinv) \
    &= (T^pinv|_(((rangev T)^perp)^perp))^inv P_nTp \
    &= (T^pinv|_(rangev T))^inv P_nTp \
    &= ((T|_nTp)^inv)^inv P_nTp quad "by" P_(rangev T) "is identity on" rangev T \
    &= T|_nTp P_nTp \
    &= T P_nTp quad "by" rangev P_nTp = nTp \
    &= T quad "by" #[@Orthogonal-Projection-Compose-T]
  $
]