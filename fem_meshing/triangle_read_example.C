# include <cstdlib>
# include <iostream>
# include <iomanip>
# include <fstream>
# include <cstring>

using namespace std;

int main ( );
int **i4mat_new ( int m, int n );
int triangle_count ( string infile );
void triangle_print ( int m, int n, int **t );
int **triangle_read ( string infile, int m, int n );

int main ( )
{
  string infile = "ell_triangles.txt";
  int m;
  int **t;

  cout << "Call triangle_count\n";
  m = triangle_count ( infile );
  cout << "M = " << m << "\n";
  t = triangle_read ( infile, m, 3 );

  triangle_print ( m, 3, t );

  return 0;
}
int triangle_count ( string infile )
{
  ifstream inunit;
  int j;
  int m;
  bool more;
  int temp;

  inunit.open ( infile.c_str ( ) );

  more = true;
  m = 0;
  for ( ; ; )
  {
    for ( j = 0; j < 3; j++ )
    {
      inunit >> temp;
      if ( inunit.eof ( ) ) 
      {
        more = false;
        break;
      }
      cout << temp << "\n";
    }
    if ( !more )
    {
      break;
    }
    m = m + 1;
  }

  inunit.close ( );

  return m;
}
void triangle_print ( int m, int n, int **t )
{
  int i;
  int j;

  cout << "\n";
  cout << "  Triangle data:\n";
  cout << "\n";
  for ( i = 0; i < m; i++ )
  {
    for ( j = 0; j < n; j++ )
    {
      cout << "  " << setw(4) << t[i][j];
    }
    cout << "\n";
  }
  return;
}
int **triangle_read ( string infile, int m, int n )
{
  ifstream inunit;
  int i, j;
  int **table;

  inunit.open ( infile.c_str ( ) );

  table = i4mat_new ( m, n );

  for ( i = 0; i < m; i++ )
  {
    for ( j = 0; j < n; j++ )
    {
      inunit >> table[i][j];
    }
  }
  
  inunit.close ( );
  
  return table;
}
//****************************************************************************80

int **i4mat_new ( int m, int n )

//****************************************************************************80
//
//  Purpose:
//
//    I4MAT_NEW allocates a new I4MAT.
//
//  Discussion:
//
//    A declaration of the form
//      int **a;
//    is necesary.  Then an assignment of the form:
//      a = i4mat_new ( m, n );
//    allows the user to assign entries to the matrix using typical
//    2D array notation:
//      a[2][3] = 17;
//      y = a[1][0];
//    and so on.
//
//  Licensing:
//
//    This code is distributed under the GNU LGPL license. 
//
//  Modified:
//
//    16 October 2007
//
//  Author:
//
//    John Burkardt
//
//  Parameters:
//
//    Input, int M, N, the number of rows and columns in the matrix.
//
//    Output, int I4MAT_NEW[M][N], a new matrix.
//
{
  int **a;
  int i;

  a = new int *[m];

  if ( a == NULL )
  {
    cerr << "\n";
    cerr << "I4MAT_NEW - Fatal error!\n";
    cerr << "  Unable to allocate row pointer array.\n";
    exit ( 1 );
  }

  for ( i = 0; i < m; i++ )
  {
    a[i] = new int[n];
    if ( a[i] == NULL )
    {
      cerr << "\n";
      cerr << "I4MAT_NEW - Fatal error!\n";
      cerr << "  Unable to allocate row array.\n";
      exit ( 1 );
    }
  }

  return a;
}
