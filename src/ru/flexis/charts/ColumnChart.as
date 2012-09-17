package ru.flexis.charts
{
	import mx.charts.ColumnChart;
	import mx.charts.series.ColumnSeries;
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	
	public class ColumnChart extends mx.charts.ColumnChart
	{
		public function ColumnChart()
		{
			super();
		}
		
		
		private var dproviders:Vector.<ArrayCollection> = new Vector.<ArrayCollection>;
		private var xs:Vector.<Number> = new Vector.<Number>;
		private var widths:Vector.<Number> = new Vector.<Number>;
		private var colors:Vector.<uint> = new Vector.<uint>;
		
		private var sizeToWidth:Number = 1;
		
		
		public function addColumn(value:Number, size:Number, color:int=-1):void
		{
			var sers:Array = this.series;
			
			var col:ColumnSeries = new ColumnSeries;
			var dprovider:ArrayCollection = new ArrayCollection([{group:"main", value:value, size:size, color:color}]);
			col.dataProvider = dprovider;
			col.yField = "value";
			col.xField = "group";
			
			series.push(col);
			
			this.series = sers;
			
			dproviders.push(dprovider);
			colors.push(color);
			widths.push(size);
			recalculateCols();
		}
		
		private function recalculateCols():void
		{
			var actualWidth:Number = this.width - Number(getStyle("gutterRight"))  - Number(getStyle("gutterLeft"));
			
			var sum:Number = 0;
			for each (var w:Number in widths)
				sum += w;
				
			sizeToWidth = actualWidth / sum;
			
			xs = new Vector.<Number>;
			xs.push(0);
			
			for (var i:int = 0; i < widths.length; i ++)
			{
				xs.push(xs[i] + widths[i] * sizeToWidth);
			}
			
			trace("!");
		}
	}
}