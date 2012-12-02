function det = sgbdi ( abd, lda, n, ml, mu, ipvt )

%*****************************************************************************80
%
%% SGBDI computes the determinant of a band matrix factored by SGBCO or SGBFA.
%
%  Discussion:
%
%    If the inverse is needed, use SGBSL N times.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 November 2006
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
%    Input, real ABD(LDA,N), the output from SGBCO or SGBFA.
%
%    Input, integer LDA, the leading dimension of the array ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer ML, MU, the number of diagonals below and above the
%    main diagonal.  0 <= ML < N, 0 <= MU < N.
%
%    Input, integer IPVT(N), the pivot vector from SGBCO or SGBFA.
%
%    Output, real DET(2), the determinant of the original matrix.
%      determinant = DET(1) * 10.0**DET(2)
%    with  1.0 <= abs ( DET(1) ) < 10.0 or DET(1) = 0.0.
%
  ten = 10.0;

  m = ml + mu + 1;
  det(1) = 1.0;
  det(2) = 0.0;

  for i = 1 : n

    if ( ipvt(i) ~= i )
      det(1) = -det(1);
    end

    det(1) = abd(m,i) * det(1);

    if ( det(1) == 0.0 )
      return
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

  return
end
