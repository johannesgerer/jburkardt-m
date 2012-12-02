function a = latin_cover ( n, p )

%*****************************************************************************80
%
%% LATIN_COVER returns a 2D Latin Square Covering.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer P(N), a permutation which describes the
%    first Latin square.
%
%    Output, integer A(N,N), the Latin cover.  A(I,J) = K
%    means that (I,J) is one element of the K-th Latin square.
%
  perm_check ( n, p );

  for i = 1 : n
    for k = 1 : n
      ik = i4_wrap ( i + k - 1, 1, n );
      a(i,p(ik)) = k;
    end
  end

  return
end
