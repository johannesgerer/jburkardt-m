function [ t, det, info ] = dtrdi ( t, ldt, n, job )

%*****************************************************************************80
%
%% DTRDI computes the determinant and inverse of a real triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 June 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, real T(LDT,N), the triangular matrix.  The zero elements of the
%    matrix are not referenced, and the corresponding elements of the array
%    can be used to store other information.
%
%    Input, integer LDT, the leading dimension of T.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer JOB, specifies the shape of T, and the task.
%    010, inverse of lower triangular matrix.
%    011, inverse of upper triangular matrix.
%    100, determinant only.
%    110, determinant and inverse of lower triangular.
%    111, determinant and inverse of upper triangular.
%
%    Output, real T(LDT,N), the inverse matrix, if requested.
%
%    Output, real DET(2), the determinant of the matrix, if
%    requested.  The determinant = DET(1) * 10.0**DET(2), with
%    1.0 <= abs ( DET(1) ) < 10.0, or DET(1) == 0.
%
%    Output, integer INFO.
%    If the inverse was requested, then
%    0, if the system was nonsingular;
%    nonzero, if the system was singular.
%
  ten = 10.0;

  info = 0;
%
%  Determinant.
%
  det(1) = 1.0;
  det(2) = 0.0;

  if ( floor ( job / 100 ) ~= 0 )

    for i = 1 : n

      det(1) = t(i,i) * det(1);

      if ( det(1) == 0.0 )
        break
      end

      while ( abs ( det(1) ) < 1.0 )
        det(1) = ten * det(1);
        det(2) = det(2) - 1.0;
      end

      while ( ten <= abs ( det(1) ) )
        det(1) = det(1) / ten;
        det(2) = det(2) + 1.0;
      end

    end

  end

  if ( mod ( floor ( job / 10 ), 10 ) == 0 )
    return
  end
%
%  Inverse of an upper triangular matrix.
%
  if ( mod ( job, 10 ) ~= 0 )

    info = 0;

    for k = 1 : n

      if ( t(k,k) == 0.0 )
        info = k;
        break
      end

      t(k,k) = 1.0 / t(k,k);
      t(1:k-1,k) = -t(1:k-1,k) * t(k,k);

      for j = k + 1 : n
        temp = t(k,j);
        t(k,j) = 0.0;
        t(1:k,j) = daxpy ( k, temp, t(1:k,k), 1, t(1:k,j), 1 );
      end

    end
%
%  Inverse of a lower triangular matrix.
%
  else

    info = 0;

    for k = n : -1 : 1

      if ( t(k,k) == 0.0 )
        info = k;
        break
      end

      t(k,k) = 1.0 / t(k,k);
      temp = -t(k,k);

      if ( k ~= n )
        t(k+1:k+n-k) = t(k+1:k+n-k) * temp;
      end

      for j = 1 : k-1
        temp = t(k,j);
        t(k,j) = 0.0;
        t(k:n,j) = daxpy ( n-k+1, temp, t(k:n,k), 1, t(k:n,j), 1 );
      end

    end

  end

  return
end
