function r8_acos_test ( )

%*****************************************************************************80
%
%% R8_ACOS_TEST tests R8_ACOS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_ACOS_TEST\n' );
  fprintf ( 1, '  R8_ACOS computes the arc-cosine of an angle.\n' ); 
  fprintf ( 1, '\n' );
  fprintf ( 1, '       C            R8_ACOS(C)        ACOS(C)\n' );
  fprintf ( 1, '\n' );

  for test = -1 : 13

    c = ( test - 6 ) / 6;

    if ( -1.0 <= c && c <= 1.0 )
      fprintf ( 1, '  %14.6g  %14.6g  %14.6g\n', c, r8_acos ( c ), acos ( c ) );
    else
      fprintf ( 1, '  %14.6g  %14.6g\n', c, r8_acos ( c ) );
    end

  end

  return
end
