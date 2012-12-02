function wavelet_test12 ( )

%*****************************************************************************80
%
%% WAVELET_TEST12 tests DAUB*_SCALE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WAVELET_TEST12\n' );
  fprintf ( 1, '  DAUB*_SCALE uses recursion to estimate a scaling function.\n' );
  fprintf ( 1, '\n' )
  fprintf ( 1, '   N        X       D2       D4       D6       D8      D10\n' );

  seed = 123456789;

  for test = 1 : 5
    fprintf ( 1, '\n' );
    [ x, seed ] = r8_uniform_01 ( seed );
    for n = 1 : 6
      fprintf ( 1, '  %2d  %7f', n, x );
      fprintf ( 1, '  %7f', daub2_scale ( n, x ) );
      fprintf ( 1, '  %7f', daub4_scale ( n, x ) );
      fprintf ( 1, '  %7f', daub6_scale ( n, x ) );
      fprintf ( 1, '  %7f', daub8_scale ( n, x ) );
      fprintf ( 1, '  %7f', daub10_scale ( n, x ) );
      fprintf ( 1, '\n' );
    end
  end

  return
end
