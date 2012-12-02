function a = euler ( n )

%*****************************************************************************80
%
%% EULER returns the N-th row of Euler's triangle.
%
%  Discussion:
%
%    E(N,K) counts the number of permutations of the N digits that have
%    exactly K "ascents", that is, K places where the Ith digit is
%    less than the (I+1)th digit.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the row of Euler's triangle desired.
%
%    Output, integer A(1:N+1), the N-th row of Euler's
%    triangle, A(K+1) contains the value of E(N,K).  Note
%    that A(1) should be 1 and A(N+1) should be 0.
%
  a(1) = 1;

  if ( 0 < n )
    a(2) = 0;
    for irow = 2 : n
      a(irow+1) = 0;
      for k = irow-1 : -1 : 1
        a(k+1) = ( k + 1 ) * a(k+1) + ( irow - k ) * a(k);
      end
      a(1) = 1;
    end
  end

  return
end
