#include<stdio.h>
int w[10][10],d[10],p[10],n;
int u,v;
void main()
{
	int i,j;
	printf("enter the no. of nodes");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			w[i][j]=999;
		}
	}
	printf("enter edges weights in  the formate of weighted matrix\n");
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			scanf("%d",&w[i][j]);	
		}
	}
	
	d[0]=0;
	p[0]=0;
	for(i=1;i<n;i++)
	{
		d[i]=999;
	}
	//bellmanford(w,d,p);
	for(u=0;u<n;u++)
	{
		for(v=0;v<n;v++)
		{
			if(d[v]>d[u]+w[u][v])
			{
				d[v]=d[u]+w[u][v];
				p[v]=u;
				
			}
			
		}
		printf(" D ---- P   iteration %d ----\n",u+1);
				for(i=0;i<n;i++)
				{
					
					printf("%d --- %d\n",d[i],p[i]);
				}
		printf("-----------------------------\n");
	}
	printf("shortest path from 0 to -\n");
	for(i=1;i<n;i++)
	{
		printf("%d is %d----its previous node is %d\n",i,d[i],p[i]);
	}
}	
