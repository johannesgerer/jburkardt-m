function det = zpbdi ( abd, lda, n, m )

%*****************************************************************************80
%
%% ZPBDI gets the determinant of a hermitian positive definite band matrix.
%
%  Discussion:
%
%    ZPBDI uses the factors computed by ZPBCO or ZPBFA.
%
%    If the inverse is needed, use ZPBSL N times.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, complex ABD(LDA,N), the output from ZPBCO or ZPBFA.
%
%    Input, integer LDA, the leading dimension of the array ABD.
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer M, the number of diagonals above the main diagonal.
%
%    Output, real DET(2), the determinant of the original matrix in the
%    form determinant = DET(1) * 10.0**DET(2) with 1.0 <= DET(1) < 10.0
%    or DET(1) == 0.0.
%
  det(1) = 1.0;
  det(2) = 0.0;

  for i = 1 : n

    det(1) = det(1) * real ( abd(m+1,i) )^2;

    if ( det(1) == 0.0 )
      break
    end

    while ( det(1) < 1.0 )
      det(1) = det(1) * 10.0;
      det(2) = det(2) - 1.0;
    end

    while ( 10.0 <= det(1) )
      det(1) = det(1) / 10.0;
      det(2) = det(2) + 1.0;
    end

  end

  return
end
