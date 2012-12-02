function subset_test069 ( )

%*****************************************************************************80
%
%% TEST069 tests JFRAC_TO_RFRAC, RFRAC_TO_JFRAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2010
%
%  Author:
%
%    John Burkardt
%

%
%  Generate the data, but force Q(M+1) to be 1.  
%  That will make it easier to see that the two operations are inverses
%  of each other.  JFRAC_TO_RFRAC is free to scale its output, and chooses
%  a scaling in which Q(M+1) is 1.
%
  seed = 123456789;
  m = 6;
  [ p, seed ] = r8vec_uniform_01 ( m, seed );
  [ q, seed ] = r8vec_uniform_01 ( m + 1, seed );

  q(1:m+1) = q(1:m+1) / q(m+1);

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST069\n' );
  fprintf ( 1, '  RFRAC_TO_JFRAC converts a rational polynomial\n' );
  fprintf ( 1, '  fraction to a J fraction.\n' );
  fprintf ( 1, '  JFRAC_TO_RFRAC converts a J fraction\n' );
  fprintf ( 1, '  to a rational polynomial fraction.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The original rational polynomial coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %8f', p(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : m + 1
    fprintf ( 1, '  %8f', q(i) );
  end
  fprintf ( 1, '\n' );
 
  [ r, s ] = rfrac_to_jfrac ( m, p, q );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The J fraction coefficients:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %8f', r(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %8f', s(i) );
  end
  fprintf ( 1, '\n' );
 
  [ p, q ] = jfrac_to_rfrac ( m, r, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The recovered rational polynomial:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %8f', p(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : m+1
    fprintf ( 1, '  %8f', q(i) );
  end
  fprintf ( 1, '\n' );

  return
end
