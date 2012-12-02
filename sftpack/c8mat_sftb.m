function x = c8mat_sftb ( n1, n2, y )

%*****************************************************************************80
%
%% C8MAT_SFTB computes a "slow" backward Fourier transform of a C8MAT.
%
%  Discussion:
%
%    SFTF and SFTB are inverses of each other.  If we begin with data
%    X and apply SFTF to get Y, and then apply SFTB to Y,
%    we should get back the original X.
%
%    This routine is provided for illustration and testing.  It is inefficient
%    relative to optimized routines that use fast Fourier techniques.
%
%    For 0 <= I1 <= N1 - 1,
%        0 <= I2 <= N2 - 1,
%
%      X(I1,I2) = Sum ( 0 <= K2 <= N2 - 1 ) Sum ( 0 <= K1 <= N1 - 1 )
%        Y(K1,K2) * exp ( 2 pi i I1 K1 / N1 ) * exp ( 2 pi i I2 K2 / N2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, N2, the number of rows and columns of data.
%
%    Input, complex Y(0:N1-1,0:N2-1), the Fourier coefficients.
%
%    Output, complex X(0:N1-1,0:N2-1), the data.
%
  x(1:n1,1:n2) = 0.0;

  for i2 = 0 : n2 - 1
    for j2 = 0 : n2 - 1
      theta2 = 2.0 * pi * i2 * j2 / n2;
      cs2 = complex ( cos ( theta2 ), - sin ( theta2 ) );
      for i1 = 0 : n1 - 1
        for j1 = 0 : n1 - 1
          theta1 = 2.0 * pi * i1 * j1 / n1;
          cs1 = complex ( cos ( theta1 ), - sin ( theta1 ) );
          x(i1+1,i2+1) = x(i1+1,i2+1) + y(j1+1,j2+1) * cs1 * cs2;
        end
      end
    end
  end

  x(1:n1,1:n2) = x(1:n1,1:n2) / ( n1 * n2 );

  return
end
