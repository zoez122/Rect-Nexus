CREATE TABLE `stores` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`channel` text NOT NULL,
	`name` text NOT NULL,
	`market` text DEFAULT 'MY' NOT NULL,
	`external_shop_id` text DEFAULT '' NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_orders` (
	`user_id` text NOT NULL,
	`channel` text NOT NULL,
	`store_id` text DEFAULT '' NOT NULL,
	`order_id` text NOT NULL,
	`line_id` text NOT NULL,
	`sku` text NOT NULL,
	`quantity` integer NOT NULL,
	`status` text NOT NULL,
	`source` text DEFAULT '未知' NOT NULL,
	`ordered_at` text NOT NULL,
	`gross` integer DEFAULT 0 NOT NULL,
	`discount` integer DEFAULT 0 NOT NULL,
	`shipping_income` integer DEFAULT 0 NOT NULL,
	`refund` integer DEFAULT 0 NOT NULL,
	`platform_fee` integer DEFAULT 0 NOT NULL,
	`transaction_fee` integer DEFAULT 0 NOT NULL,
	`affiliate_fee` integer DEFAULT 0 NOT NULL,
	`seller_shipping` integer DEFAULT 0 NOT NULL,
	`ad_cost` integer DEFAULT 0 NOT NULL,
	`other_fee` integer DEFAULT 0 NOT NULL,
	`unit_cost` integer DEFAULT 0 NOT NULL,
	`fees_complete` integer DEFAULT 0 NOT NULL,
	`updated_at` text NOT NULL,
	PRIMARY KEY(`user_id`, `channel`, `store_id`, `order_id`, `line_id`)
);
--> statement-breakpoint
INSERT INTO `__new_orders`("user_id", "channel", "store_id", "order_id", "line_id", "sku", "quantity", "status", "source", "ordered_at", "gross", "discount", "shipping_income", "refund", "platform_fee", "transaction_fee", "affiliate_fee", "seller_shipping", "ad_cost", "other_fee", "unit_cost", "fees_complete", "updated_at") SELECT "user_id", "channel", '', "order_id", "line_id", "sku", "quantity", "status", "source", "ordered_at", "gross", "discount", "shipping_income", "refund", "platform_fee", "transaction_fee", "affiliate_fee", "seller_shipping", "ad_cost", "other_fee", "unit_cost", "fees_complete", "updated_at" FROM `orders`;--> statement-breakpoint
DROP TABLE `orders`;--> statement-breakpoint
ALTER TABLE `__new_orders` RENAME TO `orders`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
ALTER TABLE `movements` ADD `store_id` text DEFAULT '' NOT NULL;