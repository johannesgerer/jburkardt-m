function set_theory_test01 ( )

%*****************************************************************************80
%
%% SET_THEORY_TEST01 demonstrates some set theory operations.
%
%  Discussion:
%
%    For most applications, I imagine it is enough to represent the sets
%    as numeric indices between 1 and N.  In this example, a universal
%    set U is defined as the integers from 1 to 50, a few subsets are
%    created, and set operations are carried out.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2011
%
%  Author:
%
%    John Burkardt
%

%
%  Define a universal set U.
%
  u = 1 : 50;
%
%  Define set A by an arithmetic property that elements of U
%  might have.  FIND will index those values (and, accidentally,
%  since U is the sequence 1:50, I and A will be identical.)
%
  i = find ( mod ( u, 5 ) == 2 );
  a = u(i);
  i4vec_transpose_print ( length ( a ), a, '  A:' );
%
%  Define B by listing its elements.
%  These happen to be elements of U divisible by 3.
%
  b = [ 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48 ];
  i4vec_transpose_print ( length ( b ), b, '  B:' );
%
%  C is the complement of B with respect to the universal set U.
%
  c = setdiff ( u, b );
  i4vec_transpose_print ( length ( c ), c, '  C = U ~ B:' );
%
%  D is the intersection of A and B.
%
  d = intersect ( a, b );
  i4vec_transpose_print ( length ( d ), d, '  D = A intersect B:' );
%
%  E is the union of A and B.
%
  e = union ( a, b );
  i4vec_transpose_print ( length ( e ), e, '  E = A union B:' );
%
%  F is the symmetric difference of A and B.
%
  f = setxor ( a, b );
  i4vec_transpose_print ( length ( f ), f, '  F = A xor B:' );
%
%  G is the complement of B with respect to A.
%  H is the complement of A with respect to B.
%
  g = setdiff ( a, b );
  i4vec_transpose_print ( length ( g ), g, '  G = A ~ B:' );

  h = setdiff ( b, a );
  i4vec_transpose_print ( length ( h ), h, '  H = B ~ A:' );
%
%  ISMEMBER checks if an element is in a set.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ISMEMBER ( I, A ) reports whether I is a member of A\n' );
  fprintf ( 1, '\n' );

  for i = 10 : 20
    if ( ismember ( i, a ) )
      fprintf ( 1, '  %d is a member of A.\n', i );
    else
      fprintf ( 1, '  %d is not a member of A.\n', i );
    end
  end
%
%  ISMEMBER checks whether a set is a subset.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ISMEMBER ( D, A ) reports whether D is a subset of A\n' );
  fprintf ( 1, '\n' );

  d = intersect ( a, b );

  if ( ismember ( d, a ) )
    fprintf ( 1, '  ( A intersect B ) is a subset of A.\n' );
  else
    fprintf ( 1, '  ( A intersect B)  is not a subset of A.\n' );
  end
%
%  To add an item to a set, use UNION, so the result is sorted.
%
  w = [ 1, 11, 21, 31, 41 ];
  i4vec_transpose_print ( length ( w ), w, '  W:' );
  x = 6;
  w = union ( w, x );
  i4vec_transpose_print ( length ( w ), w, '  W = W union 6:' );
  y = [ 16, 26, 36, 46 ];
  w = union ( w, y );
  i4vec_transpose_print ( length ( w ), w, '  W = W union [16, 26, 36, 46]:' );
%
%  Given a vector of data, UNIQUE returns the unique items, which can be used
%  to define a set.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  UNIQUE(A) returns a sorted list of the unique elements in A.\n' );
  
  x = [ 1, 10, 24, 3, 10, 1, 17, 1, 1, 10 ];
  i4vec_transpose_print ( length ( x ), x, '  X:' );
  y = unique ( x );
  i4vec_transpose_print ( length ( y ), y, '  Y = unique(X):' );

  return
end
