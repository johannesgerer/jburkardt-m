function g = mult_givens ( c, s, k, g )

%*****************************************************************************80
%
%% MULT_GIVENS applies a Givens rotation to two successive entries of a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%   
%  Modified:
%
%    25 March 2008
%
%  Author:
%
%    C original version by Lili Ju
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Richard Barrett, Michael Berry, Tony Chan, James Demmel,
%    June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%    Charles Romine, Henk van der Vorst,
%    Templates for the Solution of Linear Systems:
%    Building Blocks for Iterative Methods,
%    SIAM, 1994.
%    ISBN: 0898714710,
%    LC: QA297.8.T45.
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
%    Yousef Saad,
%    Iterative Methods for Sparse Linear Systems,
%    Second Edition,
%    SIAM, 2003,
%    ISBN: 0898715342,
%    LC: QA188.S17.
%
%  Parameters:
%
%    Input, real C, S, the cosine and sine of a Givens
%    rotation.
%
%    Input, integer K, indicates the location of the first vector entry.
%
%    Input/output, real G(1:K+1), the vector to be modified.  On output,
%    the Givens rotation has been applied to entries G(K) and G(K+1).
%
  g1 = c * g(k) - s * g(k+1);
  g2 = s * g(k) + c * g(k+1);

  g(k)   = g1;
  g(k+1) = g2;

  return
end
