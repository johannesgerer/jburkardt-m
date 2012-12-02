function check = von_mises_check ( a, b )

%*****************************************************************************80
%
%% VON_MISES_CHECK checks the parameters of the von Mises PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    -PI <= A <= PI,
%    0.0 < B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < -pi | pi < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VON_MISES_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < -PI or PI < A.\n' );
    check = 0;
    return
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VON_MISES_MEAN - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.0\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
