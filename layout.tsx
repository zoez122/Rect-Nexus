import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Rect Nexus | Cross-Border E-commerce Management System",
  description: "Rect Nexus 管理马来西亚 Shopee 与 TikTok Shop 的订单、GMV、利润和共享库存。",
  icons: {
    icon: "/favicon.svg",
    shortcut: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="zh-CN">
      <body className="antialiased">{children}</body>
    </html>
  );
}
