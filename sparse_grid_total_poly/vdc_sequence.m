function r = vdc_sequence ( n )

%*****************************************************************************80
%
%% VDC_SEQUENCE: N elements of a van der Corput sequence base 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Halton,
%    On the efficiency of certain quasi-random sequences of points
%    in evaluating multi-dimensional integrals,
%    Numerische Mathematik,
%    Volume 2, pages 84-90, 1960.
%
%    Johannes van der Corput,
%    Verteilungsfunktionen I & II,
%    Nederl. Akad. Wetensch. Proc.,
%    Volume 38, 1935, pages 813-820, pages 1058-1066.
%
%  Parameters:
%
%    Input, integer N, the number of elements to compute.
%
%    Output, real R(N,1), the elements of the van der Corput sequence base 2.
%
  r = zeros ( n, 1 );

%  Carry out the computation.
%
  seed(1:n,1) = ( 1 : n )';
  base_inv = 1.0 / 2;

  while ( any ( seed ~= 0 ) )
    digit = mod ( seed, 2 );
    r = r + digit * base_inv;
    base_inv = base_inv / 2.0;
    seed = floor ( seed / 2 );
  end

  return
end
