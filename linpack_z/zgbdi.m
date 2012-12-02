function det = zgbdi ( abd, lda, n, ml, mu, ipvt )

%*****************************************************************************80
%
%% ZGBDI computes the determinant of a band matrix factored by ZGBCO or ZGBFA.
%
%  Discussion:
%
%    If the inverse is needed, use ZGBSL N times.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2007
%
%  Author:
%
%   MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Cleve Moler, Jim Bunch and Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%
%  Parameters:
%
%    Input, complex ABD(LDA,N), the output from ZGBCO or ZGBFA.
%
%    Input, integer LDA, the leading dimension of A.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, the number of diagonals below the main diagonal.
%
%    Input, integer MU, the number of diagonals above the main diagonal.
%
%    Input, integer IPVT(N), the pivot vector from ZGBCO or ZGBFA.
%
%    Output, complex DET(2), determinant of original matrix.
%    Determinant = DET(1) * 10.0**DET(2) with 1.0 <= zabs1 ( DET(1) ) < 10.0
%    or DET(1) = 0.0.  Also, DET(2) is strictly real.
%
  m = ml + mu + 1;
  det(1) = 1.0;
  det(2) = 0.0;

  for i = 1 : n

    if ( ipvt(i) ~= i )
      det(1) = -det(1);
    end

    det(1) = det(1) * abd(m,i);

    if ( zabs1 ( det(1) ) == 0.0 )
      exit
    end

    while ( zabs1 ( det(1) ) < 1.0 )
      det(1) = det(1) * 10.0;
      det(2) = det(2) - 1.0;
    end

    while ( 10.0 <= zabs1 ( det(1) ) )
      det(1) = det(1) / 10.0;
      det(2) = det(2) + 1.0;
    end

  end

  return
end
