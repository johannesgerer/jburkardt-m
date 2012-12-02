function det = r8mat_det_5d ( a )

%*****************************************************************************80
%
%% R8MAT_DET_5D computes the determinant of a 5 by 5 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(5,5), the matrix whose determinant is desired.
%
%    Output, real DET, the determinant of the matrix.
%

%
%  Expand the determinant into the sum of the determinants of the
%  five 4 by 4 matrices created by dropping row 1, and column k.
%
  det = 0.0;

  for k = 1 : 5

    for i = 1 : 4
      for j = 1 : 4

        if ( j < k )
          inc = 0;
        else
          inc = 1;
        end

        b(i,j) = a(i+1,j+inc);

      end
    end

    det = det + (-1).^( k + 1 ) * a(1,k) * r8mat_det_4d ( b );

  end 

  return
end
