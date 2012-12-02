function [ x, seed ] = dirichlet_sample ( n, a, seed )

%*****************************************************************************80
%
%% DIRICHLET_SAMPLE samples the Dirichlet PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jerry Banks, editor,
%    Handbook of Simulation,
%    Engineering and Management Press Books, 1998, page 169.
%
%  Parameters:
%
%    Input, integer N, the number of components.
%
%    Input, real A(N), the probabilities for each component.
%    Each A(I) should be positive.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N), a sample of the PDF.  The entries
%    of X should sum to 1.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a2 = 0.0;
  b2 = 1.0;

  for i = 1 : n
    c2 = a(i);
    [ x(i), seed ] = gamma_sample ( a2, b2, c2, seed );
  end
%
%  Rescale the vector to have unit sum.
%
  x(1:n) = r8vec_unit_sum ( n, x );
  x = x';

  return
end
