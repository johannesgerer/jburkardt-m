function t = kms_eigenvalues_theta ( alpha, n )

%*****************************************************************************80
%
%% KMS_EIGENVALUES_THETA returns data needed to compute KMS eigenvalues.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Trench,
%    Spectral decomposition of Kac-Murdock-Szego matrices,
%    Unpublished technical document.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines A.
%    Eigenvalue computations require 0 <= ALPHA <= 1.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real T(N), the angles associated with
%    the eigenvalues.
%
  step_max = 100;

  t = zeros ( n, 1 );

  for i = 1 : n
%
%  Avoid confusion in first subinterval, where f(0) = 0.
%
    if ( i == 1 )
      xa = 0.0001;
    else
      xa = ( i - 1 ) * pi / ( n + 1 );
    end
    fxa = kms_eigenvalues_theta_f ( alpha, n, xa );
    xb = i * pi / ( n + 1 );
    fxb = kms_eigenvalues_theta_f ( alpha, n, xb );

    if ( 0.0 < fxa )
      temp = xa;
      xa = xb;
      xb = temp;
      temp = fxa;
      fxa = fxb;
      fxb = temp;
    end

    for step = 1 : step_max

      xc = 0.5 * ( xa + xb );
      fxc = kms_eigenvalues_theta_f ( alpha, n, xc );
%
%  Return if residual is small.
%
      if ( abs ( fxc ) <= 0.0000001 )
        break
      end
%
%  Return if interval is small.
%
      if ( abs ( xb - xa ) <= 0.0000001 )
        break
      end

      if ( fxc < 0.0 )
        xa = xc;
        fxa = fxc;
      else
        xb = xc;
        fxb = fxc;
      end

    end

    t(i) = xc;

  end

  return
end
