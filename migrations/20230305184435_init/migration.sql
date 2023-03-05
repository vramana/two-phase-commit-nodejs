-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Food" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Food_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Packet" (
    "id" SERIAL NOT NULL,
    "foodId" INTEGER NOT NULL,
    "reserved" BOOLEAN NOT NULL DEFAULT false,
    "orderId" INTEGER,

    CONSTRAINT "Packet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agent" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "reserved" BOOLEAN NOT NULL DEFAULT false,
    "orderId" INTEGER,

    CONSTRAINT "Agent_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Packet" ADD CONSTRAINT "Packet_foodId_fkey" FOREIGN KEY ("foodId") REFERENCES "Food"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Packet" ADD CONSTRAINT "Packet_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agent" ADD CONSTRAINT "Agent_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;
