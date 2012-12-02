function [ ref, seed ] = reference_tet4_sample ( n, seed )

%*****************************************************************************80
%
%% REFERENCE_TET4_SAMPLE: sample points in the reference tetrahedron.
%
%  Discussion:
%
%    This sampling method is not uniform.  The algorithm is simple.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real REF(3,N), points in the reference tetrahedron.
%
  for j = 1 : n
    [ c, seed ] = r8vec_uniform_01 ( 4, seed );
    c_sum = sum ( c(1:4) );
    ref(1:3,j) = c(1:3)' / c_sum;
  end

  return
end
