package ru.flexis.charts
{
	[Bindable]
	public class ColumnDataItem
	{
		public function ColumnDataItem(value:Number, size:Number, color:int)
		{
			this.color = color;
			this.value = value;
			this.size = size;
		}
		
		public var color:int;
		public var value:Number;
		public var size:Number;
		
		public var height:int
		public var width:int;
	}
}