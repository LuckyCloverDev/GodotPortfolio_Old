extends Node


var current_area = "d5"

var dir = ["UP", "DOWN", "LEFT", "RIGHT"]

var UP = ["up", "north"]
var DOWN = ["down", "south"]
var LEFT = ["left", "west"]
var RIGHT = ["right", "east"]
var ASCEND = ["up", "ascend"]
var DESCEND = ["down", "descend"]

var PLACES = [UP, DOWN, LEFT, RIGHT]

var map_vars = {
	"a1" : {
		"area_name" : "a1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b1", false], "LEFT" : ["", true, ""], "RIGHT" : ["a2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a2" : {
		"area_name" : "a2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["a1", false], "RIGHT" : ["a3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a3" : {
		"area_name" : "a3",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["a2", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a5" : {
		"area_name" : "a5",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["a6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a6" : {
		"area_name" : "a6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["a5", false], "RIGHT" : ["a7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a7" : {
		"area_name" : "a7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b7", false], "LEFT" : ["a6", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a10" : {
		"area_name" : "a10",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b10", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a12" : {
		"area_name" : "a12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b12", false], "LEFT" : ["", true, ""], "RIGHT" : ["a13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a13" : {
		"area_name" : "a13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b13", false], "LEFT" : ["a12", false], "RIGHT" : ["a14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a14" : {
		"area_name" : "a14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b14", false], "LEFT" : ["a13", false], "RIGHT" : ["a15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"a15" : {
		"area_name" : "a15",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["b15", false], "LEFT" : ["a14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b1" : {
		"area_name" : "b1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a1", false], "DOWN" : ["c1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b7" : {
		"area_name" : "b7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a7", false], "DOWN" : ["c7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b9" : {
		"area_name" : "b9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["c9", false], "LEFT" : ["", true, ""], "RIGHT" : ["b10", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b10" : {
		"area_name" : "b10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a10", false], "DOWN" : ["", true, ""], "LEFT" : ["b9", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b12" : {
		"area_name" : "b12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a12", false], "DOWN" : ["c12", false], "LEFT" : ["", true, ""], "RIGHT" : ["b13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b13" : {
		"area_name" : "b13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a13", false], "DOWN" : ["c13", false], "LEFT" : ["b12", false], "RIGHT" : ["b14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b14" : {
		"area_name" : "b14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a14", false], "DOWN" : ["c14", false], "LEFT" : ["b13", false], "RIGHT" : ["b15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"b15" : {
		"area_name" : "b15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["a15", false], "DOWN" : ["c15", false], "LEFT" : ["b14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c1" : {
		"area_name" : "",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["b1", false], "DOWN" : ["d1", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["c2", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"VALID_KEYS" : ["Ancient Key", "Old Key"],
		"person" : []
		},
	"c2" : {
		"area_name" : "c2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["c1", true, "LOCKED"], "RIGHT" : ["c3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"VALID_KEYS" : ["Ancient Key"],
		"person" : []
		},
	"c3" : {
		"area_name" : "c3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["c2", false], "RIGHT" : ["c4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c4" : {
		"area_name" : "c4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["c3", false], "RIGHT" : ["c5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c5" : {
		"area_name" : "c5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["d5", false], "LEFT" : ["c4", false], "RIGHT" : ["c6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c6" : {
		"area_name" : "c6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["c5", false], "RIGHT" : ["c7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c7" : {
		"area_name" : "c7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["b7", false], "DOWN" : ["d7", false], "LEFT" : ["c6", false], "RIGHT" : ["c8", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c8" : {
		"area_name" : "c8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["c7", true, "LOCKED"], "RIGHT" : ["c9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c9" : {
		"area_name" : "c9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["b9", false], "DOWN" : ["", true, ""], "LEFT" : ["c8", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c12" : {
		"area_name" : "c12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["b12", false], "DOWN" : ["d12", false], "LEFT" : ["", true, ""], "RIGHT" : ["c13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c13" : {
		"area_name" : "c13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["b13", false], "DOWN" : ["d13", false], "LEFT" : ["c12", false], "RIGHT" : ["c14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c14" : {
		"area_name" : "c14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["b14", false], "DOWN" : ["d14", false], "LEFT" : ["c13", false], "RIGHT" : ["c15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"c15" : {
		"area_name" : "c15",
		"safe_space" : null,
		"description" : "also tempura-ry",
		"UP" : ["b15", false], "DOWN" : ["d15", false], "LEFT" : ["c14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d1" : {
		"area_name" : "d1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["c1", true, "LOCKED"], "DOWN" : ["e1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"VALID_KEYS" : ["Old Key"],
		"person" : []
		},
	"d5" : {
		"area_name" : "d5",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["c5", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : true,
		"LAYER" : 1,
		"ITEMS" : [["key3", "key", "digital"], ["key1", "key", "ancient"], ["key2", "key", "old"]],
		"ITEMDESCRIPTION" : ["A shiny new keycard lays on the floor. It looks expensive!", "A key of incredibly old proportions lays on the ground before you.", "An old key lies off to the side."],
		"person" : [[["test_dummy", "person"], "A person with a key stands beside you."]]
		},
	"d7" : {
		"area_name" : "d7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["c7", false], "DOWN" : ["e7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d9" : {
		"area_name" : "d9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["c9", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["d10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d10" : {
		"area_name" : "d10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["e10", false], "LEFT" : ["d9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d12" : {
		"area_name" : "d12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["c12", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["d13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d13" : {
		"area_name" : "d13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["c13", false], "DOWN" : ["", true, ""], "LEFT" : ["d12", false], "RIGHT" : ["d14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d14" : {
		"area_name" : "d14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["c14", false], "DOWN" : ["", true, ""], "LEFT" : ["d13", false], "RIGHT" : ["d15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"d15" : {
		"area_name" : "d15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", false], "DOWN" : ["", false], "LEFT" : ["", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"e1" : {
		"area_name" : "e1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["d1", false], "DOWN" : ["f1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"e3" : {
		"area_name" : "e3",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["f3", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "-1e3",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"e7" : {
		"area_name" : "e7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["d7", false], "DOWN" : ["f7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"e10" : {
		"area_name" : "e10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["d10", false], "DOWN" : ["f10", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"e15" : {
		"area_name" : "e15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["d15", false], "DOWN" : ["f15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f1" : {
		"area_name" : "f1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["e1", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["f2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f2" : {
		"area_name" : "f2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["f1", false], "RIGHT" : ["f3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f3" : {
		"area_name" : "f3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["e3", true, "LOCKED"], "DOWN" : ["", true, ""], "LEFT" : ["f2", false], "RIGHT" : ["f4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"VALID_KEYS" : ["Digital Key"],
		"person" : []
		},
	"f4" : {
		"area_name" : "f4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["f3", false], "RIGHT" : ["f5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f5" : {
		"area_name" : "f5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["g5", false], "LEFT" : ["f4", false], "RIGHT" : ["f6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f6" : {
		"area_name" : "f6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["f5", false], "RIGHT" : ["f7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f7" : {
		"area_name" : "f7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["e7", false], "DOWN" : ["", true, ""], "LEFT" : ["f6", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f10" : {
		"area_name" : "f10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["e10", false], "DOWN" : ["g10", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f13" : {
		"area_name" : "f13",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["g13", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "-1f13",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"f15" : {
		"area_name" : "f15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["e15", true, ""], "DOWN" : ["g15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"g5" : {
		"area_name" : "g5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["f5", false], "DOWN" : ["h5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"g9" : {
		"area_name" : "g9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["h9", false], "LEFT" : ["", true, ""], "RIGHT" : ["g10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"g10" : {
		"area_name" : "g10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["f10", false], "DOWN" : ["", true, ""], "LEFT" : ["g9", false], "RIGHT" : ["g11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"g11" : {
		"area_name" : "g11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["h11", false], "LEFT" : ["g10", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"g13" : {
		"area_name" : "g13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["f13", true, ""], "DOWN" : ["h13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"g15" : {
		"area_name" : "g15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["f15", false], "DOWN" : ["h15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h1" : {
		"area_name" : "h1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["i1", false], "LEFT" : ["", true, ""], "RIGHT" : ["h2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h2" : {
		"area_name" : "h2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["h1", false], "RIGHT" : ["h3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h3" : {
		"area_name" : "h3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["i3", false], "LEFT" : ["h2", false], "RIGHT" : ["h4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h4" : {
		"area_name" : "h4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["i4", false], "LEFT" : ["h3", false], "RIGHT" : ["h5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h5" : {
		"area_name" : "h5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["g5", false], "DOWN" : ["i5", false], "LEFT" : ["h4", false], "RIGHT" : ["h6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h6" : {
		"area_name" : "h6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["h5", false], "RIGHT" : ["h7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h7" : {
		"area_name" : "h7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["i7", false], "LEFT" : ["h6", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h9" : {
		"area_name" : "h9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["g9", false], "DOWN" : ["i9", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h11" : {
		"area_name" : "h11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["g11", false], "DOWN" : ["i11", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h13" : {
		"area_name" : "h13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["g13", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["h14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h14" : {
		"area_name" : "h14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", false, ""], "LEFT" : ["h13", false], "RIGHT" : ["h15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"h15" : {
		"area_name" : "h15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["g15", false], "DOWN" : ["i15", false], "LEFT" : ["h14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i1" : {
		"area_name" : "i1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h1", false], "DOWN" : ["j1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i3" : {
		"area_name" : "i3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h3", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["i4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i4" : {
		"area_name" : "i4",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["h4", false], "DOWN" : ["", true, ""], "LEFT" : ["i3", false], "RIGHT" : ["i5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i5" : {
		"area_name" : "i5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h5", false], "DOWN" : ["j5", false], "LEFT" : ["i4", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i7" : {
		"area_name" : "i7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h7", false], "DOWN" : ["j7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i9" : {
		"area_name" : "i9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h9", false], "DOWN" : ["j9", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i11" : {
		"area_name" : "i11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h11", false], "DOWN" : ["j11", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"i15" : {
		"area_name" : "i15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["h15", false], "DOWN" : ["j15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j1" : {
		"area_name" : "j1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["i1", false], "DOWN" : ["k1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j5" : {
		"area_name" : "j5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["i5", false], "DOWN" : ["k5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j7" : {
		"area_name" : "j7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["i7", false], "DOWN" : ["k7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j9" : {
		"area_name" : "j9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["i9", false], "DOWN" : ["k10", false], "LEFT" : ["", true, ""], "RIGHT" : ["j10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j10" : {
		"area_name" : "j10",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["j9", false], "RIGHT" : ["j11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j11" : {
		"area_name" : "j11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["i11", false], "DOWN" : ["", true, ""], "LEFT" : ["j10", false], "RIGHT" : ["j12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j12" : {
		"area_name" : "j12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["j11", false], "RIGHT" : ["j13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j13" : {
		"area_name" : "j13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["j12", false], "RIGHT" : ["j14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j14" : {
		"area_name" : "j14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["j13", false], "RIGHT" : ["j15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"j15" : {
		"area_name" : "j15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["i15", false], "DOWN" : ["", true, ""], "LEFT" : ["j14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k1" : {
		"area_name" : "k1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["j1", false], "DOWN" : ["l1", false], "LEFT" : ["", true, ""], "RIGHT" : ["k2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k2" : {
		"area_name" : "k2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["k1", false], "RIGHT" : ["k3", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k3" : {
		"area_name" : "k3",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["k2", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k5" : {
		"area_name" : "k5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["j5", false], "DOWN" : ["l5", false], "LEFT" : ["", true, ""], "RIGHT" : ["k6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : true,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k6" : {
		"area_name" : "k6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["k5", false], "RIGHT" : ["k7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k7" : {
		"area_name" : "k7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["j7", false], "DOWN" : ["", true, ""], "LEFT" : ["k6", false], "RIGHT" : ["k8", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k8" : {
		"area_name" : "k8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["k7", true, "LOCKED"], "RIGHT" : ["k9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"k9" : {
		"area_name" : "k9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["j9", false], "DOWN" : ["l9", false], "LEFT" : ["k8", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l1" : {
		"area_name" : "l1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["k1", false], "DOWN" : ["m1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l5" : {
		"area_name" : "l5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["k5", false], "DOWN" : ["m5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l9" : {
		"area_name" : "l9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["k9", true], "DOWN" : ["", false, ""], "LEFT" : ["", true, ""], "RIGHT" : ["l10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l10" : {
		"area_name" : "l10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["l9", false], "RIGHT" : ["l11", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l11" : {
		"area_name" : "l11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["l10", true, "LOCKED"], "RIGHT" : ["l12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l12" : {
		"area_name" : "l12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["m12", false], "LEFT" : ["l11", false], "RIGHT" : ["l13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l13" : {
		"area_name" : "l13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["m13", false], "LEFT" : ["l12", false], "RIGHT" : ["l14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"l14" : {
		"area_name" : "l14",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["m14", false], "LEFT" : ["l13", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m1" : {
		"area_name" : "m1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["l1", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["m2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m2" : {
		"area_name" : "m2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["m1", false], "RIGHT" : ["m3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m3" : {
		"area_name" : "m3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["m2", false], "RIGHT" : ["m4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m4" : {
		"area_name" : "m4",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["m3", false], "RIGHT" : ["m5", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m5" : {
		"area_name" : "m5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["l5", false], "DOWN" : ["n5", false], "LEFT" : ["m4", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m7" : {
		"area_name" : "m7",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["n7", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "2m7", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m12" : {
		"area_name" : "m12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["l12", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["m8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m13" : {
		"area_name" : "m13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["l13", false], "DOWN" : ["n13", false], "LEFT" : ["m12", false], "RIGHT" : ["m14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m14" : {
		"area_name" : "m14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["l14", false], "DOWN" : ["n14", false], "LEFT" : ["m13", false], "RIGHT" : ["m15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"m15" : {
		"area_name" : "m15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["n15", false], "LEFT" : ["m14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n5" : {
		"area_name" : "n5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["m5", false], "DOWN" : ["o5", false], "LEFT" : ["", true, ""], "RIGHT" : ["n6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n6" : {
		"area_name" : "n6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["n5", false], "RIGHT" : ["n7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n7" : {
		"area_name" : "n7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["m7", true, "LOCKED"], "DOWN" : ["o7", true, "LOCKED"], "LEFT" : ["n6", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n9" : {
		"area_name" : "n9",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["o9", false], "LEFT" : ["", true, ""], "RIGHT" : ["n10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n10" : {
		"area_name" : "n10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["o10", false], "LEFT" : ["n9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n13" : {
		"area_name" : "n13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["m13", false], "DOWN" : ["o13", false], "LEFT" : ["", true, ""], "RIGHT" : ["n14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n14" : {
		"area_name" : "n14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["m14", false], "DOWN" : ["o14", false], "LEFT" : ["n13", false], "RIGHT" : ["n15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"n15" : {
		"area_name" : "n15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["m15", false], "DOWN" : ["", true, ""], "LEFT" : ["n14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o1" : {
		"area_name" : "o1",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["o2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o2" : {
		"area_name" : "o2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["o1", false], "RIGHT" : ["o3", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o3" : {
		"area_name" : "o3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["o2", true, "LOCKED"], "RIGHT" : ["o4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o4" : {
		"area_name" : "o4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["o3", false], "RIGHT" : ["o5", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o5" : {
		"area_name" : "o5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["n5", false], "DOWN" : ["", true, ""], "LEFT" : ["o4", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o7" : {
		"area_name" : "o7",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["n7", true, "LOCKED"], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "2o7", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o9" : {
		"area_name" : "o9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["n9", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["o10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o10" : {
		"area_name" : "o10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["n10", false], "DOWN" : ["", true, ""], "LEFT" : ["o9", false], "RIGHT" : ["o11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o11" : {
		"area_name" : "o11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["o10", false], "RIGHT" : ["o12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o12" : {
		"area_name" : "o12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["o11", false], "RIGHT" : ["o13", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o13" : {
		"area_name" : "o13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["n13", false], "DOWN" : ["", true, ""], "LEFT" : ["o12", true, "LOCKED"], "RIGHT" : ["o14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"o14" : {
		"area_name" : "o14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["n14", false], "DOWN" : ["", true, ""], "LEFT" : ["o13", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	
	
	"2a1" : {
		"area_name" : "2a1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2b1", false], "LEFT" : ["", true, ""], "RIGHT" : ["2a2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a2" : {
		"area_name" : "2a2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a1", false], "RIGHT" : ["2a3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a3" : {
		"area_name" : "2a3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a2", false], "RIGHT" : ["2a4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a4" : {
		"area_name" : "2a4",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a3", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a6" : {
		"area_name" : "2a6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2b6", false], "LEFT" : ["", true, ""], "RIGHT" : ["2a7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a7" : {
		"area_name" : "2a7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a6", false], "RIGHT" : ["2a8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a8" : {
		"area_name" : "2a8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a7", false], "RIGHT" : ["2a9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a9" : {
		"area_name" : "2a9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a8", false], "RIGHT" : ["2a10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a10" : {
		"area_name" : "2a10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a9", false], "RIGHT" : ["2a11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a11" : {
		"area_name" : "2a11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a10", false], "RIGHT" : ["2a12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a12" : {
		"area_name" : "2a12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a11", false], "RIGHT" : ["2a13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a13" : {
		"area_name" : "2a13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a12", false], "RIGHT" : ["2a14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a14" : {
		"area_name" : "",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2a13", false], "RIGHT" : ["2a15", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2a15" : {
		"area_name" : "2a15",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2b15", false], "LEFT" : ["2a14", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2b1" : {
		"area_name" : "2b1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2a1", false], "DOWN" : ["2c1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2b6" : {
		"area_name" : "2b6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2a6", false], "DOWN" : ["2c6", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2b15" : {
		"area_name" : "2b15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2a15", false], "DOWN" : ["2c15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c1" : {
		"area_name" : "2c1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2b1", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2c2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c2" : {
		"area_name" : "2c2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c1", false], "RIGHT" : ["2c3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c3" : {
		"area_name" : "2c3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c2", false], "RIGHT" : ["2c4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c4" : {
		"area_name" : "2c4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c3", false], "RIGHT" : ["2c3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c5" : {
		"area_name" : "2c5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2d5", true, "LOCKED"], "LEFT" : ["2c4", false], "RIGHT" : ["2c6", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c6" : {
		"area_name" : "2c6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2b6", false], "DOWN" : ["", true, ""], "LEFT" : ["2c5", true, "LOCKED"], "RIGHT" : ["2c7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c7" : {
		"area_name" : "2c7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c6", false], "RIGHT" : ["2c8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c8" : {
		"area_name" : "2c8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c7", false], "RIGHT" : ["2c9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c9" : {
		"area_name" : "2c9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c8", false], "RIGHT" : ["2c10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c10" : {
		"area_name" : "2c10",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2c9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2c15" : {
		"area_name" : "2c15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2b15", false], "DOWN" : ["2d15", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2d5" : {
		"area_name" : "2d5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2c5", true, "LOCKED"], "DOWN" : ["2e5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2d12" : {
		"area_name" : "2d12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2d13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2d13" : {
		"area_name" : "2d13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2d12", false], "RIGHT" : ["2d14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2d14" : {
		"area_name" : "2d14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2d13", false], "RIGHT" : ["2d15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2d15" : {
		"area_name" : "2d15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2c15", true, "LOCKED"], "DOWN" : ["2e15", false], "LEFT" : ["2d14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e1" : {
		"area_name" : "2e1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2f1", false], "LEFT" : ["", true, ""], "RIGHT" : ["2e2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e2" : {
		"area_name" : "2e2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2e1", false], "RIGHT" : ["2e3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e3" : {
		"area_name" : "2e3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2f3", false], "LEFT" : ["2e2", false], "RIGHT" : ["2e4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e4" : {
		"area_name" : "2e4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2e3", false], "RIGHT" : ["2e5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e5" : {
		"area_name" : "2e5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2d5", false], "DOWN" : ["2f5", false], "LEFT" : ["2e4", false], "RIGHT" : ["2e6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e6" : {
		"area_name" : "2e6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2e5", false], "RIGHT" : ["2e7", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e7" : {
		"area_name" : "2e7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2f7", false], "LEFT" : ["2e6", true, "LOCKED"], "RIGHT" : ["2e8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e8" : {
		"area_name" : "2e8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2f8", false], "LEFT" : ["2e7", false], "RIGHT" : ["2e9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e9" : {
		"area_name" : "2e9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2f9", false], "LEFT" : ["2e8", false], "RIGHT" : ["2e10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e10" : {
		"area_name" : "2e10",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2f10", false], "LEFT" : ["2f9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2e15" : {
		"area_name" : "2e15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2d15", false], "DOWN" : ["2f15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f1" : {
		"area_name" : "2f1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e1", false], "DOWN" : ["2g1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f3" : {
		"area_name" : "2f3",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["2e3", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f5" : {
		"area_name" : "2f5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e5", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f7" : {
		"area_name" : "2f7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e7", false], "DOWN" : ["2g7", false], "LEFT" : ["", true, ""], "RIGHT" : ["2f8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f8" : {
		"area_name" : "2f8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e8", false], "DOWN" : ["2g8", false], "LEFT" : ["2f7", false], "RIGHT" : ["2f9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f9" : {
		"area_name" : "2f9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e9", false], "DOWN" : ["2g9", false], "LEFT" : ["2f8", false], "RIGHT" : ["2f10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f10" : {
		"area_name" : "2f10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e10", false], "DOWN" : ["2g10", false], "LEFT" : ["2f9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2f15" : {
		"area_name" : "2f15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2e15", false], "DOWN" : ["2g15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2g1" : {
		"area_name" : "2g1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2f1", false], "DOWN" : ["2h1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2g7" : {
		"area_name" : "2g7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2f7", false], "DOWN" : ["2h7", false], "LEFT" : ["", true, ""], "RIGHT" : ["2g8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2g8" : {
		"area_name" : "2g8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2f8", false], "DOWN" : ["", true, ""], "LEFT" : ["2g7", false], "RIGHT" : ["2g9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2g9" : {
		"area_name" : "2g9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2f9", false], "DOWN" : ["", true, ""], "LEFT" : ["2g8", false], "RIGHT" : ["2g10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2g10" : {
		"area_name" : "",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2f10", false], "DOWN" : ["2h10", true, "LOCKED"], "LEFT" : ["2g9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2g15" : {
		"area_name" : "2g15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2f15", false], "DOWN" : ["2h15", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h1" : {
		"area_name" : "2h1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2g1", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2h2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h2" : {
		"area_name" : "2h2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h1", false], "RIGHT" : ["2h3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h3" : {
		"area_name" : "2h3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h2", false], "RIGHT" : ["2h4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h4" : {
		"area_name" : "2h4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h3", false], "RIGHT" : ["2h5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h5" : {
		"area_name" : "2h5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h4", false], "RIGHT" : ["2h6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h6" : {
		"area_name" : "2h6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h5", false], "RIGHT" : ["2h7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h7" : {
		"area_name" : "2h7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2g7", false], "DOWN" : ["2i7", false], "LEFT" : ["2h6", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h10" : {
		"area_name" : "2h10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2g10", true, "LOCKED"], "DOWN" : ["2i10", false], "LEFT" : ["", true, ""], "RIGHT" : ["2h11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h11" : {
		"area_name" : "2h11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h10", false], "RIGHT" : ["2h12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h12" : {
		"area_name" : "2h12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2i12", false], "LEFT" : ["2h11", false], "RIGHT" : ["2h13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h13" : {
		"area_name" : "2h13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h12", false], "RIGHT" : ["2h14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h14" : {
		"area_name" : "2h14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2h13", false], "RIGHT" : ["2h15", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2h15" : {
		"area_name" : "2h15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2g15", false], "DOWN" : ["2i15", false], "LEFT" : ["2h14", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2i7" : {
		"area_name" : "2i7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2h7", false], "DOWN" : ["2j7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2i10" : {
		"area_name" : "2i10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2h10", false], "DOWN" : ["2j10", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2i12" : {
		"area_name" : "2i12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2h12", false], "DOWN" : ["2j12", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2i15" : {
		"area_name" : "2i15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2h15", false], "DOWN" : ["2j15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2j7" : {
		"area_name" : "2j7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2i7", false], "DOWN" : ["2k7", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2j10" : {
		"area_name" : "2j10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2i10", false], "DOWN" : ["2k10", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2j12" : {
		"area_name" : "2j12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2i12", false], "DOWN" : ["2k12", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2j15" : {
		"area_name" : "2j15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2i15", false], "DOWN" : ["2k15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k1" : {
		"area_name" : "2k1",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2k2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k2" : {
		"area_name" : "2k2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2k1", false], "RIGHT" : ["2k3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k3" : {
		"area_name" : "2k3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2k2", false], "RIGHT" : ["2k4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k4" : {
		"area_name" : "2k4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2l4", false], "LEFT" : ["2k3", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k7" : {
		"area_name" : "2k7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2j7", false], "DOWN" : ["2l7", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k10" : {
		"area_name" : "2k10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2j10", false], "DOWN" : ["2l10", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["2k11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k11" : {
		"area_name" : "2k11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2k10", false], "RIGHT" : ["2k12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k12" : {
		"area_name" : "2k12",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["2j12", false], "DOWN" : ["", true, ""], "LEFT" : ["2k11", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k14" : {
		"area_name" : "2k14",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2k15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2k15" : {
		"area_name" : "2k15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2j15", false], "DOWN" : ["", true, ""], "LEFT" : ["2k14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l4" : {
		"area_name" : "2l4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2k4", false], "DOWN" : ["2m4", false], "LEFT" : ["", true, ""], "RIGHT" : ["2l5", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l5" : {
		"area_name" : "2l5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2l4", true, "LOCKED"], "RIGHT" : ["2l6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l6" : {
		"area_name" : "2l6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2l5", false], "RIGHT" : ["2l7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l7" : {
		"area_name" : "2l7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2k7", true, "LOCKED"], "DOWN" : ["2m7", true, "LOCKED"], "LEFT" : ["2l6", false], "RIGHT" : ["2l8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l8" : {
		"area_name" : "2l8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2l7", false], "RIGHT" : ["2l9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l9" : {
		"area_name" : "2l9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2l8", false], "RIGHT" : ["2l10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2l10" : {
		"area_name" : "2l10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2k10", true, "LOCKED"], "DOWN" : ["2m10", false], "LEFT" : ["2l9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m4" : {
		"area_name" : "2m4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2l4", false], "DOWN" : ["2n4", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m7" : {
		"area_name" : "2m7",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["2l7", true, "LOCKED"], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "m7",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m10" : {
		"area_name" : "2m10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2l10", false], "DOWN" : ["2n10", false], "LEFT" : ["", true, ""], "RIGHT" : ["2m11", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m11" : {
		"area_name" : "2m11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2m10", true, "LOCKED"], "RIGHT" : ["2m12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m12" : {
		"area_name" : "2m12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2m11", false], "RIGHT" : ["2m13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m13" : {
		"area_name" : "2m13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2n13", false], "LEFT" : ["2m12", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2m15" : {
		"area_name" : "2m15",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["2n15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2n4" : {
		"area_name" : "2n4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2m4", false], "DOWN" : ["2o4", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2n10" : {
		"area_name" : "2n10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2m10", false], "DOWN" : ["2o10", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2n13" : {
		"area_name" : "2n13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2m13", false], "DOWN" : ["2o13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2n15" : {
		"area_name" : "2n15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2m15", false], "DOWN" : ["2o15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o4" : {
		"area_name" : "2o4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2n4", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2o5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o5" : {
		"area_name" : "2o5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2o4", false], "RIGHT" : ["2o6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o6" : {
		"area_name" : "2o6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2o5", false], "RIGHT" : ["2o7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o7" : {
		"area_name" : "2o7",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2o6", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "o7",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o9" : {
		"area_name" : "2o9",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2o10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o10" : {
		"area_name" : "2o10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2n10", false], "DOWN" : ["", true, ""], "LEFT" : ["2o9", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o13" : {
		"area_name" : "2o13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2n13", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["2o14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o14" : {
		"area_name" : "2o14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["2o13", false], "RIGHT" : ["2o15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"2o15" : {
		"area_name" : "2o15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["2n15", false], "DOWN" : ["", true, ""], "LEFT" : ["2o14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : 2,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	
	
	"-1a5" : {
		"area_name" : "-1a5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1b5", false], "LEFT" : ["", true, ""], "RIGHT" : ["-1a6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a6" : {
		"area_name" : "-1a6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1a5", false], "RIGHT" : ["-1a7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a7" : {
		"area_name" : "-1a7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1a6", false], "RIGHT" : ["-1a8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a8" : {
		"area_name" : "-1a8",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1b8", false], "LEFT" : ["-1a7", false], "RIGHT" : ["-1a9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a9" : {
		"area_name" : "-1a9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1a8", false], "RIGHT" : ["-1a10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a10" : {
		"area_name" : "-1a10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1a9", false], "RIGHT" : ["-1a11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a11" : {
		"area_name" : "-1a11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1a10", false], "RIGHT" : ["-1a12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a12" : {
		"area_name" : "-1a12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1a11", false], "RIGHT" : ["-1a13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1a13" : {
		"area_name" : "-1a13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1b13", false], "LEFT" : ["-1a12", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1b1" : {
		"area_name" : "-1b1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1c1", false], "LEFT" : ["", true, ""], "RIGHT" : ["-1b2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1b2" : {
		"area_name" : "-1b2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1c2", false], "LEFT" : ["-1b1", false], "RIGHT" : ["-1b3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1b3" : {
		"area_name" : "-1b3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1c3", false], "LEFT" : ["-1b2", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1b5" : {
		"area_name" : "-1b5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1a5", false], "DOWN" : ["-1c5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1b8" : {
		"area_name" : "-1b8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1a8", false], "DOWN" : ["-1c8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1b13" : {
		"area_name" : "-1b13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1a13", false], "DOWN" : ["-1c13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1c1" : {
		"area_name" : "-1c1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1b1", false], "DOWN" : ["-1d1", false], "LEFT" : ["-1c2", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1c2" : {
		"area_name" : "-1c2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1b2", false], "DOWN" : ["", true, ""], "LEFT" : ["-1c1", false], "RIGHT" : ["-1c3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1c3" : {
		"area_name" : "-1c3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1b3", false], "DOWN" : ["", true, ""], "LEFT" : ["-1c2", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1c5" : {
		"area_name" : "-1c5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1b5", false], "DOWN" : ["-1d5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1c8" : {
		"area_name" : "-1c8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1b8", false], "DOWN" : ["-1d8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1c13" : {
		"area_name" : "-1c13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1b13", false], "DOWN" : ["-1d13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1d1" : {
		"area_name" : "-1d1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1c1", false], "DOWN" : ["-1e1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1d5" : {
		"area_name" : "-1d5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1c5", false], "DOWN" : ["-1e5", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1d8" : {
		"area_name" : "-1d8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1c8", false], "DOWN" : ["-1e8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1d13" : {
		"area_name" : "-1d13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1c13", false], "DOWN" : ["-1e13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e1" : {
		"area_name" : "-1e1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1d1", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["-1e2", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e2" : {
		"area_name" : "-1e2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1e1", true, "LOCKED"], "RIGHT" : ["-1e3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e3" : {
		"area_name" : "-1e3",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1f3", false], "LEFT" : ["-1e2", false], "RIGHT" : ["-1e4", false],
		"HIGHER" : "e3", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e4" : {
		"area_name" : "-1e4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1e3", false], "RIGHT" : ["-1e5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e5" : {
		"area_name" : "-1e5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1d5", false], "DOWN" : ["", true, ""], "LEFT" : ["-1e4", false], "RIGHT" : ["-1e6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e6" : {
		"area_name" : "-1e6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1e5", false], "RIGHT" : ["-1e7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e7" : {
		"area_name" : "-1e7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1e6", false], "RIGHT" : ["-1e8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e8" : {
		"area_name" : "-1e8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1d8", false], "DOWN" : ["-1f8", false], "LEFT" : ["-1e7", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1e13" : {
		"area_name" : "-1e13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1d13", true, "LOCKED"], "DOWN" : ["-1f13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f3" : {
		"area_name" : "-1f3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1e3", false], "DOWN" : ["-1g3", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f8" : {
		"area_name" : "-1f8",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["-1e8", false], "DOWN" : ["-1g8", false], "LEFT" : ["", true, ""], "RIGHT" : ["-1f9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f9" : {
		"area_name" : "-1f9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1f8", false], "RIGHT" : ["-1f10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f10" : {
		"area_name" : "-1f10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1f9", false], "RIGHT" : ["-1f11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f11" : {
		"area_name" : "-1f11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1f10", false], "RIGHT" : ["-1f12", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f12" : {
		"area_name" : "-1f12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1f11", true, "LOCKED"], "RIGHT" : ["-1f13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f13" : {
		"area_name" : "-1f13",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["-1e13", false], "DOWN" : ["-1g13", false], "LEFT" : ["-1f12", false], "RIGHT" : ["-1f14", false],
		"HIGHER" : "f13", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f14" : {
		"area_name" : "-1f14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1f13", false], "RIGHT" : ["-1f15", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1f15" : {
		"area_name" : "-1f15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1g15", false], "LEFT" : ["-1f14", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1g3" : {
		"area_name" : "-1g3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1f3", false], "DOWN" : ["-1h3", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1g8" : {
		"area_name" : "-1g8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1f8", false], "DOWN" : ["-1h8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1g13" : {
		"area_name" : "-1g13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1f13", false], "DOWN" : ["-1h13", true, "LOCKED"], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1g15" : {
		"area_name" : "-1g15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1f15", false], "DOWN" : ["-1h15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1h1" : {
		"area_name" : "-1h1",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1i1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1h3" : {
		"area_name" : "-1h3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1g3", false], "DOWN" : ["-1i3", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1h8" : {
		"area_name" : "-1h8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1g8", false], "DOWN" : ["-1i8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1h13" : {
		"area_name" : "-1h13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1g13", true, "LOCKED"], "DOWN" : ["-1i13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1h15" : {
		"area_name" : "-1h15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1g15", false], "DOWN" : ["-1i15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1i1" : {
		"area_name" : "-1i1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1h1", false], "DOWN" : ["-1j1", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1i3" : {
		"area_name" : "-1i3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1h3", false], "DOWN" : ["-1j3", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1i8" : {
		"area_name" : "-1i8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1h8", false], "DOWN" : ["-1j8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1i13" : {
		"area_name" : "-1i13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1h13", false], "DOWN" : ["-1j13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1i15" : {
		"area_name" : "-1i15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1h15", false], "DOWN" : ["-1j15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j1" : {
		"area_name" : "-1j1",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1i1", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["-1j2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j2" : {
		"area_name" : "-1j2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1j1", false], "RIGHT" : ["-1j3", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j3" : {
		"area_name" : "-1j3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1i3", false], "DOWN" : ["", true, ""], "LEFT" : ["-1j2", true, "LOCKED"], "RIGHT" : ["-1j4", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j4" : {
		"area_name" : "-1j4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1k4", false], "LEFT" : ["-1j3", false], "RIGHT" : ["-1j5", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j5" : {
		"area_name" : "-1j5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1j4", false], "RIGHT" : ["-1j6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j6" : {
		"area_name" : "-1j6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1j5", false], "RIGHT" : ["-1j7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j7" : {
		"area_name" : "-1j7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1j6", false], "RIGHT" : ["-1j8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j8" : {
		"area_name" : "-1j8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1i8", false], "DOWN" : ["-1k8", false], "LEFT" : ["-1j7", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j13" : {
		"area_name" : "-1j13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1i13", false], "DOWN" : ["-1k13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1j15" : {
		"area_name" : "-1j15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1i15", false], "DOWN" : ["-1k15", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k4" : {
		"area_name" : "-1k4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1j4", false], "DOWN" : ["-1l4", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k8" : {
		"area_name" : "-1k8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1j8", false], "DOWN" : ["-1l8", false], "LEFT" : ["", true, ""], "RIGHT" : ["-1k9", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k9" : {
		"area_name" : "-1k9",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1k8", false], "RIGHT" : ["-1k10", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k10" : {
		"area_name" : "-1k10",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1k9", false], "RIGHT" : ["-1k11", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k11" : {
		"area_name" : "-1k11",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1k10", false], "RIGHT" : ["-1k12", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k12" : {
		"area_name" : "-1k12",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1k11", false], "RIGHT" : ["-1k13", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k13" : {
		"area_name" : "-1k13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1j13", false], "DOWN" : ["-1l13", true, "LOCKED"], "LEFT" : ["-1k12", false], "RIGHT" : ["-1k14", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k14" : {
		"area_name" : "-1k14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1k13", true, "LOCKED"], "RIGHT" : ["-1k15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1k15" : {
		"area_name" : "-1k15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1j15", false], "DOWN" : ["", true, ""], "LEFT" : ["-1k14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1l1" : {
		"area_name" : "-1l1",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["-1l2", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1l2" : {
		"area_name" : "-1l2",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1l1", false], "RIGHT" : ["-1l3", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1l3" : {
		"area_name" : "-1l3",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1l2", false], "RIGHT" : ["-1l4", true, "LOCKED"],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1l4" : {
		"area_name" : "-1l4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1k4", false], "DOWN" : ["-1m4", false], "LEFT" : ["-1l3", true, "LOCKED"], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1l8" : {
		"area_name" : "-1l8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1k8", false], "DOWN" : ["-1m8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1l13" : {
		"area_name" : "-1l13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1k13", true, "LOCKED"], "DOWN" : ["-1m13", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1m4" : {
		"area_name" : "-1m4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1m8" : {
		"area_name" : "-1m8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1l8", false], "DOWN" : ["-1n8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1m13" : {
		"area_name" : "-1m13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1l13", false], "DOWN" : ["-1n13", false], "LEFT" : ["", true, ""], "RIGHT" : ["-1m14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1m14" : {
		"area_name" : "-1m14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1n14", false], "LEFT" : ["-1m13", false], "RIGHT" : ["-1m15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1m15" : {
		"area_name" : "-1m15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["-1n15", false], "LEFT" : ["-1m14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1n4" : {
		"area_name" : "-1n4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1m4", false], "DOWN" : ["-1o4", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1n8" : {
		"area_name" : "-1n8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1m8", false], "DOWN" : ["-1o8", false], "LEFT" : ["", true, ""], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1n13" : {
		"area_name" : "-1n13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1m13", false], "DOWN" : ["-1o13", false], "LEFT" : ["", true, ""], "RIGHT" : ["-1n14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1n14" : {
		"area_name" : "-1n14",
		"safe_space" : true,
		"description" : "also tempura-ry",
		"UP" : ["-1m14", false], "DOWN" : ["-1o14", false], "LEFT" : ["-1n13", false], "RIGHT" : ["-1n15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1n15" : {
		"area_name" : "-1n15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1m15", false], "DOWN" : ["-1o15", false], "LEFT" : ["-1n14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o4" : {
		"area_name" : "-1o4",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1n4", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o5" : {
		"area_name" : "-1o5",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1o4", false], "RIGHT" : ["-1o6", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o6" : {
		"area_name" : "-1o6",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1o5", false], "RIGHT" : ["-1o7", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o7" : {
		"area_name" : "-1o7",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["", true, ""], "DOWN" : ["", true, ""], "LEFT" : ["-1o6", false], "RIGHT" : ["-1o8", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o8" : {
		"area_name" : "-1o8",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1n8", false], "DOWN" : ["", true, ""], "LEFT" : ["-1o7", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o13" : {
		"area_name" : "-1o13",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1n13", false], "DOWN" : ["", true, ""], "LEFT" : ["", true, ""], "RIGHT" : ["-1o14", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o14" : {
		"area_name" : "-1o14",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1n14", false], "DOWN" : ["", true, ""], "LEFT" : ["-1o13", false], "RIGHT" : ["-1o15", false],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	"-1o15" : {
		"area_name" : "-1o15",
		"safe_space" : false,
		"description" : "also tempura-ry",
		"UP" : ["-1n15", false], "DOWN" : ["", true, ""], "LEFT" : ["-1n14", false], "RIGHT" : ["", true, ""],
		"HIGHER" : "", "LOWER" : "",
		"DISCOVERED" : false,
		"LAYER" : -1,
		"ITEMS" : [],
		"ITEMDESCRIPTION" : [],
		"person" : []
		},
	
}


#i think the name says it all here
func move(place: String) -> Array:
	#get the places next to the current area
	var next_to = []
	for i in dir:
		if map_vars[current_area][i][0] != "" and map_vars.has(map_vars[current_area][i][0]):
			#add all of the valid areas to an array
			next_to.append([i, map_vars[current_area][i][0].to_lower()])
	
	#for each directional array
	for direction in PLACES:
		if map_vars.has(map_vars[current_area][direction[0].to_upper()][0]):
			#if the place is in the array and is next to the current area
			if place in direction and map_vars[current_area][direction[0].to_upper()][0] != "":
				if map_vars[current_area][direction[0].to_upper()][1]:
					#if room is locked, dont let them in!
					if map_vars[current_area][direction[0].to_upper()][2] == "":
						return ["That room is locked!"]
					else:
						return [map_vars[current_area][direction[0].to_upper()][2]]
				else:
					#move to a new place, discover it, and return a success message
					current_area = map_vars[current_area][direction[0].to_upper()][0]
					map_vars[current_area]["DISCOVERED"] = true
					return ["You move to %s.\n%s" % [map_vars[current_area]["area_name"], inspect()], -1, map_vars[current_area]["safe_space"]]
	
	#for each direction
	for i in next_to:
		#if the place is an area name, not a direction and exists
		if place == map_vars[i[1]]["area_name"].to_lower():
			if map_vars[current_area][i[0]][1]:
				#if room is locked, dont let them in!
				if map_vars[current_area][i[0]][2] == "":
					return ["That room is locked!"]
				else:
					return [map_vars[current_area][i[0]][2]]
			else:
				#move to a new place, discover it, and return a success message
				current_area = map_vars[current_area][i[0]][0]
				map_vars[current_area]["DISCOVERED"] = true
				return ["You move to %s.\n%s" % [map_vars[current_area]["area_name"], inspect()], -1, map_vars[current_area]["safe_space"]]
	
	if place == "insane":
		return ["You've already done that!"]
	
	#if the place to move to has a message rather than another place, display
	#message
	for direction in PLACES:
		if place in direction and map_vars[current_area][direction[0].to_upper()][0] != "":
			return [map_vars[current_area][direction[0].to_upper()][0]]
	
	#if the place doesn't match, return a failed message
	return ["You can't move there!"]


#moves through layers and return the message associated
func change_height(place: String, climable_item: bool, direction = null) -> String:
	#if a direction has not been specified
	if place == "":
		return "Climb where?"
	
	#if the place is actually an item in the area and is climable
	if place in map_vars[current_area]["ITEMS"] and climable_item == true:
		#if there's a direction
		if direction != null:
			#if the direction is valid
			if climb(direction):
				return "You climbed the %s to %s\n%s" % [place, current_area, inspect()]
			else:
				if direction in ["ascend", "descend"]:
					return "You can't %s %s." % [direction, place]
				else:
					return "You can't climb %s %s." % [direction, place]
		#if there is no direction
		else:
			return "What direction?"
	#if the place is just a place
	else:
		#if said place exists
		if climb(place):
			return "You move to %s.\n%s" % [map_vars[current_area]["area_name"], inspect()]
		#if said place doesn't exist
		else:
			if place in ["ascend", "descend"]:
				return "You can't %s here." % place
			else:
				return "You can't climb %s here." % place


#checks if a direction is valid
func climb(place: String) -> bool:
	#if the direction is up and also exists
	if place in ASCEND and map_vars[current_area]["HIGHER"] != "":
		#go to the area and make sure it's now discovered
		current_area = map_vars[current_area]["HIGHER"]
		map_vars[current_area]["DISCOVERED"] = true
		return true
	#if the direction is down and also exists
	elif place in DESCEND and map_vars[current_area]["LOWER"] != "":
		#go to the area and make sure it's now discovered
		current_area = map_vars[current_area]["LOWER"]
		map_vars[current_area]["DISCOVERED"] = true
		return true
	else:
		#if it doesn't exist at all, don't go
		return false


#actually does the checking of the areas
func check_areas(area: String) -> Array:
	#if the area in this direction exists
	if map_vars[current_area][area][0] != "" and map_vars.has(map_vars[current_area][area][0]):
		#if the area is discovered
		if map_vars[map_vars[current_area][area][0]]["DISCOVERED"]:
			#return the name
			return [map_vars[map_vars[current_area][area][0]]["area_name"], map_vars[current_area][area][1]]
		else:
			#if it exists but hasn't been discovered, return ???
			return ["???", map_vars[current_area][area][1]]
	#if it doesn't exist, return X
	else:
		return ["X", true]


#return the description of the room as well as the items in it
func inspect() -> String:
	#add room description
	var item_desc = map_vars[current_area]["area_name"] + "\n" +  map_vars[current_area]["description"]
	
	#if there's a person, add their description
	if map_vars[current_area].has("person"):
		for people in map_vars[current_area]["person"]:
			item_desc += "\n" + people[1]
	
	#if there are items in the room
	if map_vars[current_area]["ITEMDESCRIPTION"].size() > 0:
		#run through each item and add its description to the text
		for descs in map_vars[current_area]["ITEMDESCRIPTION"]:
			item_desc += "\n"
			item_desc += descs
	
	#return the final text
	return item_desc


#checks if item is valid, if not it returns a message without changing anything else
func item_check(item_name: String) -> Array:
	#find the specific item
	var item_index = -1
	for i in range(map_vars[current_area]["ITEMS"].size()):
		if item_name in map_vars[current_area]["ITEMS"][i]:
			item_index = i
	
	#if the item is in the room
	if item_index != -1:
		var item_value = map_vars[current_area]["ITEMS"][item_index][0]
		
		#take the item out of the room
		map_vars[current_area]["ITEMS"].remove(item_index)
		map_vars[current_area]["ITEMDESCRIPTION"].remove(item_index)
		
		#return that the item is valid as well as the name of the item
		return [true, item_value]
	elif item_name == "dignity":
		return [false, "Don't flatter yourself kid"]
	elif item_name == "":
		#if theres no item, return asking which item
		return [false, "Take what?"]
	else:
		#if the item has been typed, but doesn't exist, return this
		return [false, ""]


#checks if key can be used, and if so, uses it!
func key_check(key_vars: Array) -> bool:
	if map_vars[current_area].has("VALID_KEYS") and map_vars[current_area]['VALID_KEYS'].has(key_vars[0]):
		map_vars[key_vars[1][1]][key_vars[1][2]][1] = false
		map_vars[key_vars[1][3]][key_vars[1][4]][1] = false
		
		return true
	
	return false
