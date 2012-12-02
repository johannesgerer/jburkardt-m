function test120 ( )

%*****************************************************************************80
%
%% TEST120 tests RAT_FAREY2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  max_n = 4;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST120\n' );
  fprintf ( 1, '  RAT_FAREY2 computes a row of the Farey fraction table.\n' );

  a = [];
  b = [];
  
  for n = 0 : max_n

    [ a, b ] = rat_farey2 ( n, a, b );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row %d\n', n+1 );

    for ilo = 1 : 20 : 2^n+1
      ihi = min ( ilo+20-1, 2^n+1 );
      fprintf ( 1, '\n' );
      for i = ilo : ihi
        fprintf ( 1, '%3d', a(i) );
      end 
      fprintf ( 1, '\n' );
      for i = ilo : ihi
        fprintf ( 1, '%3d', b(i) );
      end 
      fprintf ( 1, '\n' );
    end

  end

  return
end
