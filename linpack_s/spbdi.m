function det = spbdi ( abd, lda, n, m )

%*****************************************************************************80
%
%% SPBDI computes the determinant of a matrix factored by SPBCO or SPBFA.
%
%  Discussion:
%
%    If the inverse is needed, use SPBSL N times.
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
%    Input, real ABD(LDA,N), the output from SPBCO or SPBFA.
%
%    Input, integer LDA, the leading dimension of the array ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%
%    Output, real DET(2), the determinant of the original
%    matrix in the form
%      determinant = DET(1) * 10.0^DET(2)
%    with 1.0 <= DET(1) < 10.0 or DET(1) == 0.0.
%

%
%  Compute the determinant.
%
  det(1) = 1.0;
  det(2) = 0.0;
  s = 10.0;

  for i = 1 : n

    det(1) = abd(m+1,i) * abd(m+1,i) * det(1);

    if ( det(1) == 0.0 )
      return;
    end

    while ( det(1) < 1.0 )
      det(1) = s * det(1);
      det(2) = det(2) - 1.0;
    end

    while ( s <= det(1) ) 
      det(1) = det(1) / s;
      det(2) = det(2) + 1.0;
    end

  end

  return
end
