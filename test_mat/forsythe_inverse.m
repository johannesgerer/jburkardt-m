function a = forsythe_inverse ( alpha, beta, n )

%*****************************************************************************80
%
%% FORSYTHE_INVERSE returns the inverse of the Forsythe matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969,
%    ISBN: 0882756494,
%    LC: QA263.G68.
%
%  Parameters:
%
%    Input, real ALPHA, BETA, define the matrix.  
%    The Forsythe matrix does not have an inverse if both ALPHA and BETA are zero.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
% 
  if ( beta == 0.0 & alpha == 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'FORSYTHE_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The Forsythe matrix is not invertible if\n' );
    fprintf ( 1, '  both ALPHA and BETA are 0.\n' );
    error ( 'FORSYTHE_INVERSE - Fatal error!' );

  else if ( beta == 0.0 )

    for j = 1 : n
      for i = 1 : n
 
        if ( j == n )
          a(i,j) = 1.0 / alpha;
        elseif ( j == i - 1 )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      end
    end
%
%  Set up the original Jordan matrix as B.
%
  else
%
%  Compute inverse of unperturbed Jordan matrix.
%
    for j = 1 : n
      for i = 1 : n

        if ( i <= j )
          a(i,j) =  - ( - 1.0 / beta )^(j+1-i);
        else
          a(i,j) = 0.0;
        end

      end
    end
%
%  Add rank one perturbation.
%
    z = - 1.0 / beta;

    for j = 1 : n
      for i = 1 : n
        a(i,j) = a(i,j) - alpha * z^(n+1+j-i) / ( 1 - alpha * z^n );
      end
    end

  end

  return
end

